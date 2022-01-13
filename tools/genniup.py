import inspect
import json
import re
import sys
import textwrap


def load_iup_json():
    with open('iup.json', 'r') as fp:
        metadata = json.load(fp)

    result = {}
    for s in metadata:
        result[s['ClassName']] = s

    return result


def load_iup_callbacks_json():
    with open('iup_callbacks.json', 'r') as fp:
        metadata = json.load(fp)

    return metadata


def load_iup_attrs_json():
    with open('iup_attrs.json', 'r') as fp:
        metadata = json.load(fp)

    return metadata


def load_alt_ctors_json():
    with open('alt_ctors.json', 'r') as fp:
        alt_ctors = json.load(fp)
    return alt_ctors


def get_all_classes(iup_json_metadata):
    all_classes = set()
    for k in iup_json_metadata.keys():
        all_classes.add(k)

    return all_classes


def load_nimc():
    proc_re = re.compile(r"proc (?P<func>.*)\*\((?P<args>.*)\)(: (?P<ret>.*))? {(?P<pragma>.*)}")
    result = {}
    sources = ['../src/niup/inc/c/cd_proc.nim',
               '../src/niup/inc/c/im_proc.nim',
               '../src/niup/inc/c/iup_proc.nim']
    for src in sources:
        with open(src, 'r') as fp:
            for line in fp:
                line = line.strip()
                m = proc_re.match(line)
                if m:
                    result[m.group('func').lower()] = {'func': m.group('func'),
                                                       'args': m.group('args'),
                                                       'ret': m.group('ret'),
                                                       'pragma': m.group('pragma')}
    return result


def gen_types(all_classes, nimc):
    classes = sorted(list(all_classes))
    print("type")
    all_types = []
    for class_name in classes:
        func_t = f"{nimc[class_name]['func']}_t"
        print(f"  {func_t}* = distinct PIhandle")
        all_types.append(func_t)

    print()
    print("type IUPhandle_t* =", " | ".join(all_types))
    print()


def gen_ctors(class_name, iup_json_metadata, nimc, alt_ctors):
    n = nimc[class_name]
    ret = f"{n['func']}_t"
    args, call_args = get_args(n)
    doc = iup_json_metadata[class_name]['Documentation']
    if doc is not None:
        doc = textwrap.wrap(iup_json_metadata[class_name]['Documentation'],
                            initial_indent='    # ', subsequent_indent='    # ')
        doc = "\n".join(doc)
        doc = f'{doc}\n'
    else:
        doc = ""

    if 'varargs' in n['pragma']:
        code = gen_ctor_macro(n, ret, doc)
    else:
        code = gen_ctor_proc(args, call_args, n, ret, doc)
    print(code)

    if class_name in alt_ctors:
        code = gen_ctor_proc(alt_ctors[class_name]['args'], alt_ctors[class_name]['call_args'], n, ret, doc)
        print(code)


def gen_ctor_proc(args, call_args, n, ret, doc):
    p = f"proc {n['func']}*({args}): {ret} {{.cdecl.}} ="
    code = f"return {ret}(niupc.{n['func']}({call_args}))\n"
    code = textwrap.indent(textwrap.dedent(code), " " * 4)
    return f"{p}\n{doc}{code}"


def gen_ctor_macro(n, ret, doc):
    p = f"macro {n['func']}*(args: varargs[untyped]): {ret} ="
    code = f"""
            result = nnkCall.newTree(
                nnkDotExpr.newTree(
                    newIdentNode("niup"),
                    newIdentNode("{ret}")
                  ),
               )
            let inner = nnkCall.newTree(
                    newIdentNode("{n['func']}")
                  )
        
            if args.len > 0:
                for i in 0 ..< args.len:
                  inner.add nnkCast.newTree(newIdentNode("PIhandle"), args[i])
            inner.add newNilLit()
            result.add inner
            
        """
    code = textwrap.indent(textwrap.dedent(code), " " * 4)
    return f"{p}\n{doc}\n{code}"


def get_args(n):
    c2nim = {'cstring': 'string',
             'PIhandle': 'IUPhandle_t',
             'ptr PIhandle': 'ptr IUPhandle_t',
             'ptr uint8': 'openArray[uint8]',
             'uptr_t': 'clong',
             'sptr_t': 'clong',
             ' stringArray': ' cstringArray' # fix previous rename :(
             }

    args = n['args']
    for key, value in c2nim.items():
        args = args.replace(key, value)

    call_args_list = n['args'].split(';')
    call_args = []

    for c in call_args_list:
        if c == "":
            continue

        (v, t) = c.split(':')
        v = v.strip()
        t = t.strip()

        if t in ['cint', 'var cint', 'var cdouble', 'cdouble', 'cuint', 'ptr cdouble', 'pointer',
                 'cstringArray', 'cfloat', 'uint8', 'ptr clong', 'clong', 'ptr cint', ]:
            call_args.append(v)
        elif t == 'cstring':
            call_args.append(f"cstring({v})")
        elif t == 'ptr uint8':
            call_args.append(f'cast[ptr uint8]({v})')
        elif t in ['PIhandle', 'ptr PIhandle', 'Icallback']:
            call_args.append(f"cast[{t}]({v})")
        elif t in ['ptr cdContext', 'ptr cdCanvas', 'ptr imImage']:
            call_args.append(v)
        elif t in ['uptr_t', 'sptr_t']:
            call_args.append(v)
        else:
            #print("TODO:", v,t)
            call_args.append(v)

    return args, ", ".join(call_args)


def gen_attr_setter(class_name, attr_name, data_type, data_format, doc, handle, nimc):
    if doc is not None:
        doc = textwrap.wrap(doc,
                            initial_indent='    # ', subsequent_indent='    # ')
        doc = "\n".join(doc)
        doc = f"{doc}\n"
    else:
        doc = ""

    if data_type == 'Boolean':
        gen_attr_setter_str(class_name, doc, attr_name, nimc)
        gen_attr_setter_alt(class_name, '', attr_name, nimc, 'yes:bool', '(if yes: "YES" else: "NO")')
    elif data_type == 'String':
        gen_attr_setter_str(class_name, doc, attr_name, nimc)

        if data_format == 'Binary':
            print(f"# TODO ??? {data_type} {data_format} {class_name}")
        elif data_format == 'Rgb':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'red, green, blue:int, alpha:int = 255',
                                '&"{red} {green} {blue} {alpha}"')
        elif data_format == 'LinColPosCommaSeparated':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'lin, col:int', '&"{lin},{col}"')
        elif data_format == 'Enum':
            # TODO use enums?
            pass
        elif data_format == 'Size':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'width, height:int', '&"{width}x{height}"')
        elif data_format == 'DialogSize':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'width, height:int', '&"{width}x{height}"')
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'width: string, height:int', '&"{width}x{height}"')
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'width: int, height:string', '&"{width}x{height}"')
        elif data_format == 'FloatRangeCommaSeparated':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'min, max:float', '&"{min},{max}"')
        elif data_format == 'RangeCommaSeparated':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'min, max:int', '&"{min},{max}"')
        elif data_format == 'XYPosCommaSeparated':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'x, y:int', '&"{x},{y}"')
        elif data_format == 'XYPosColonSeparated':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'x, y:int', '&"{x}:{y}"')
        elif data_format == 'Selection':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'lin1,col1,lin2,col2:int', '&"{lin1},{col1}:{lin2},{col2}"')
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'col1,col2:int', '&"{col1}:{col2}"')
        elif data_format == 'Rect':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'x1, y1, x2, y2:int', '&"{x1} {y1} {x2} {y2}"')
        elif data_format == 'Margin':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'horiz, vert:int', '&"{horiz}x{vert}"')
        elif data_format == 'Alignment':
            pass
        else:
            print('TODO', class_name, data_type, data_format)
            sys.exit()
    elif data_type == 'Int':
        gen_attr_setter_str(class_name, doc, attr_name, nimc)

        if data_format == 'Binary':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'x:int', '&"{x}"')
        elif data_format == 'Enum':
            # TODO use enums?
            pass
        else:
            print('TODO', class_name, data_type, data_format)
            sys.exit()
    elif data_type == 'Double':
        gen_attr_setter_str(class_name, doc, attr_name, nimc)

        if data_format == 'Binary':
            gen_attr_setter_alt(class_name, '', attr_name, nimc, 'x:int64', '&"{x}"')
        else:
            print('TODO', class_name, data_type, data_format)
            sys.exit()
    elif data_type == 'Handle':
        if data_format == 'Binary':
            if handle is not None:
                if handle['NativeType'] == 'Image':
                    gen_attr_setter_handle(class_name, doc, attr_name, nimc, 'Image_t | ImageRGB_t | ImageRGBA_t')
                elif handle['NativeType'] == 'Void' and attr_name == 'ADDFORMATTAG_HANDLE':
                    gen_attr_setter_alt(class_name, '', attr_name, nimc, 'handle: User_t', 'cast[cstring](handle)')
                elif handle['NativeType'] == 'Control':
                    gen_attr_setter_handle(class_name, doc, attr_name, nimc, 'IUPhandle_t')
                elif handle['NativeType'] == 'Menu':
                    gen_attr_setter_handle(class_name, doc, attr_name, nimc, 'Menu_t')
                elif handle['NativeType'] == 'Dialog':
                    gen_attr_setter_handle(class_name, doc, attr_name, nimc, 'IUPhandle_t')  # TODO limit to any *Dialog_t?
                else:
                    print('TODO Handle Binary NativeType:', class_name, data_type, data_format, handle['NativeType'])
                    sys.exit()
            else:
                gen_attr_setter_handle(class_name, doc, attr_name, nimc, 'User_t')
        else:
            print('TODO Handle: ', class_name, data_type, data_format)
            sys.exit()
    elif data_type == 'Unknown':
        print(f"# TODO unknown: {class_name} {attr_name} {data_type} {data_format}")
    elif data_type == 'Void':
        gen_attr_setter_alt(class_name, '', attr_name, nimc, '', '""')
    elif data_type == 'VoidPtr':
        # TODO
        pass
    else:
        print('unsupported', class_name, data_type)
        sys.exit()


def gen_attr_setter_str(class_name, doc, attr_name, nimc):
    proc = attr_name.lower()
    niup_type = f"{nimc[class_name]['func']}_t"
    code = f"    SetAttribute(cast[PIhandle](ih), cstring(\"{attr_name}\"), cstring(value))"
    p = f"proc `{proc}=`*(ih: {niup_type}, value: string) {{.cdecl.}} ="
    print(f"{p}\n{doc}{code}")
    print()
    p = f"proc `{proc}`*(ih: {niup_type}, value: string) {{.cdecl.}} ="
    code = textwrap.indent(textwrap.dedent(code), " " * 4)
    print(f"{p}\n{code}")
    print()


def gen_attr_setter_alt(class_name, doc, attr_name, nimc, alt_ctor, alt_call):
    proc = attr_name.lower()
    niup_type = f"{nimc[class_name]['func']}_t"
    code = f"    SetAttribute(cast[PIhandle](ih), cstring(\"{attr_name}\"), cstring({alt_call}))"
    p = f"proc `{proc}=`*(ih: {niup_type}, {alt_ctor}) {{.cdecl.}} ="
    print(f"{p}\n{doc}{code}")
    print()
    p = f"proc `{proc}`*(ih: {niup_type}, {alt_ctor}) {{.cdecl.}} ="
    code = textwrap.indent(textwrap.dedent(code), " " * 4)
    print(f"{p}\n{code}")
    print()


def gen_attr_setter_handle(class_name, doc, attr_name, nimc, handle_type):
    proc = attr_name.lower()
    niup_type = f"{nimc[class_name]['func']}_t"
    code = f"    SetAttributeHandle(cast[PIhandle](ih), cstring(\"{attr_name}\"), cast[PIhandle](handle))"
    p = f"proc `{proc}=`*(ih: {niup_type}, handle: {handle_type}) {{.cdecl.}} ="
    print(f"{p}\n{doc}{code}")
    print()
    p = f"proc `{proc}`*(ih: {niup_type}, handle: {handle_type}) {{.cdecl.}} ="
    code = textwrap.indent(textwrap.dedent(code), " " * 4)
    print(f"{p}\n{code}")
    print()


def gen_attr_getter_str(class_name, attr_name, nimc):
    proc = attr_name.lower()
    niup_type = f"{nimc[class_name]['func']}_t"
    code = f"""
    proc `{proc}`*(ih: {niup_type}): string {{.cdecl.}} =
        return $GetAttribute(cast[PIhandle](ih), cstring(\"{attr_name}\"))
    """
    print(inspect.cleandoc(code))
    print()


def gen_attr_getter_alt(class_name, attr_name, nimc, get_type, get_exp):
    proc = attr_name.lower()
    niup_type = f"{nimc[class_name]['func']}_t"
    code = f"""
    proc `{proc}`*(ih: {niup_type}): {get_type} {{.cdecl.}} =
        return {get_exp}
    """
    print(inspect.cleandoc(code))
    print()


def gen_attr_getter(class_name, data_type, attr_name, nimc):
    if data_type == 'Boolean':
        gen_attr_getter_alt(class_name, attr_name, nimc, 'bool', f'$GetAttribute(cast[PIhandle](ih), cstring("{attr_name}")) == "YES"')
    else:
        gen_attr_getter_str(class_name, attr_name, nimc)


def gen_attrs_code(class_name, iup_json_metadata, nimc, iup_attrs_json_metadata):
    attrs = sorted(iup_json_metadata[class_name]['Attributes'], key=lambda x: x['AttributeName'])
    for md in attrs:
        if md['AttributeName'] in ['3STATE', 'FALSE', 'TRUE', 'VISIBLE_ITEMS', 'SHOW_TEXT']:
            # ignore for now
            continue

        if md['NumberedAttribute'] != 'No':
            print(f"# TODO getter {class_name} {md['AttributeName']}")
            continue

        data_type = md['DataType']
        attr_name = md['AttributeName']
        data_format = md['DataFormat']
        doc = md['Documentation']

        if not md['ReadOnly']:
            gen_attr_setter(class_name, attr_name, data_type, data_format, doc, md['Handle'], nimc)

        if not md['WriteOnly']:
            gen_attr_getter(class_name, data_type, attr_name, nimc)

    if class_name in iup_attrs_json_metadata:
        for attr_name, aval in iup_attrs_json_metadata[class_name].items():
            for c in aval:
                if 'ctor' in c:
                    gen_attr_setter_alt(class_name, c['doc'], attr_name, nimc, c['ctor'],
                                        c['call'])
                elif 'handle_type' in c:
                    gen_attr_setter_handle(class_name, c['doc'], attr_name, nimc, c['handle_type'])
                else:
                    print(class_name, c)
                    print('TODO gen_attrs_code from attr json')
                    sys.exit()


def get_callback_generic_args(json_args_list):
    args = ['ih: PIhandle']
    cnt = 2
    for arg in json_args_list:
        if arg == 'Int':
            cb_arg_type = 'cint'
        elif arg == 'String':
            cb_arg_type = 'cstring'
        elif arg == 'Float':
            cb_arg_type = 'cfloat'
        elif arg == 'Double':
            cb_arg_type = 'cdouble'
        elif arg == 'VoidPtr':
            cb_arg_type = 'pointer'
        elif arg == 'Char':
            cb_arg_type = 'uint8'
        elif arg == 'Handle':
            cb_arg_type = 'PIhandle'
        elif arg == 'RefInt':
            cb_arg_type = 'ptr cint'
        else:
            print("TODO get callback args type ", arg)
            sys.exit()

        args.append(f'arg{cnt}: {cb_arg_type}')
        cnt += 1
    return ", ".join(args)


def gen_callback_code(args, callback_md, niup_type):
    cb_proto = f'proc ({args}): cint'
    doc = callback_md['Documentation']
    proc = callback_md['AttributeName'].lower()
    attr_name = callback_md['AttributeName']

    if doc is not None:
        doc = textwrap.wrap(doc,
                            initial_indent='    # ', subsequent_indent='    # ')
        doc = "\n".join(doc)
        doc = f"{doc}\n"
    else:
        doc = ""

    p = f'proc `{proc}=`*(ih: {niup_type}, cb: {cb_proto} {{.cdecl.}}) {{.cdecl.}} ='
    code = f'    SetCallback(cast[PIhandle](ih), cstring("{attr_name}"), cast[Icallback](cb))'
    print(f"{p}\n{doc}{code}")
    print()
    p = f'proc `{proc}`*(ih: {niup_type}, cb: {cb_proto} {{.cdecl.}}) {{.cdecl.}} ='
    code = f'    SetCallback(cast[PIhandle](ih), cstring("{attr_name}"), cast[Icallback](cb))'
    print(f"{p}\n{code}")
    print()

    p = f'proc `{proc}`*(ih: {niup_type}): proc (ih: PIhandle): cint {{.cdecl.}} ='
    code = f'    return cast[proc (ih: PIhandle): cint {{.cdecl.}}](GetCallback(cast[PIhandle](ih), cstring("{attr_name}")))'
    print(f"{p}\n{code}")
    print()


def gen_callbacks_code(class_name, iup_json_metadata, iup_callbacks_json_metadata, nimc):
    niup_type = f"{nimc[class_name]['func']}_t"
    cbs = sorted(iup_json_metadata[class_name]['Callbacks'], key=lambda x: x['AttributeName'])
    for callback_md in cbs:
        args = get_callback_args(callback_md, class_name, iup_callbacks_json_metadata)
        gen_callback_code(args, callback_md, niup_type)


def get_callback_args(callback_md, class_name, iup_callbacks_json_metadata):
    args = None
    if callback_md['AttributeName'] in iup_callbacks_json_metadata:
        if class_name in iup_callbacks_json_metadata[callback_md['AttributeName']]:
            args = iup_callbacks_json_metadata[callback_md['AttributeName']][class_name]
        elif '*' in iup_callbacks_json_metadata[callback_md['AttributeName']]:
            args = iup_callbacks_json_metadata[callback_md['AttributeName']]['*']

    if args is None:
        args = get_callback_generic_args(callback_md['Arguments'])

    return args


def gen_code(all_classes, iup_json_metadata, nimc, alt_ctors, iup_callbacks_json_metadata, iup_attrs_json_metadata):
    classes = sorted(list(all_classes))

    for class_name in classes:
        gen_ctors(class_name, iup_json_metadata, nimc, alt_ctors)
        gen_attrs_code(class_name, iup_json_metadata, nimc, iup_attrs_json_metadata)
        gen_callbacks_code(class_name, iup_json_metadata, iup_callbacks_json_metadata, nimc)


def gen_misc_fn(class_name, nimc):
    n = nimc[class_name]
    proc = n['func']
    ret = n['ret']
    args, call_args = get_args(n)
    discard = ''

    if ret in ['uptr_t', 'sptr_t']:
        ret = 'clong'
    elif ret == 'cstring':
        ret = 'string'

    if 'varargs' in n['pragma']:
        code = f"# TODO varargs: {proc}({args}){call_args}"
    else:
        if ret:
            if ret == 'string':
                retstr = '$'
            else:
                retstr = ''
            call = f"  return {retstr}niupc.{proc}({call_args})"
            ret = f": {ret}"
            exception_procs = ['Open', 'SetFocus', 'GetFile', 'SetHandle', 'Map', 'ShowXY', 'Show', 'MainLoop',
                               'SetAttributes']
            if proc in exception_procs:
                discard = ', discardable'
        else:
            ret = ""
            call = f"  niupc.{proc}({call_args})"

        print(f"proc {proc}*({args}){ret} {{.cdecl{discard}.}} =")
        print(f"  {call}")
        print()


def gen_misc(all_classes, nimc):
    for class_name in nimc.keys():
        if class_name in all_classes:
            continue
        gen_misc_fn(class_name, nimc)


def main():
    iup_json_metadata = load_iup_json()
    iup_callbacks_json_metadata = load_iup_callbacks_json()
    iup_attrs_json_metadata = load_iup_attrs_json()
    alt_ctors = load_alt_ctors_json()

    # ods_classes, attributes, attr_map, callback, cb_map = load_iup_ods()
    all_classes = get_all_classes(iup_json_metadata)
    nimc = load_nimc()

    gen_types(all_classes, nimc)
    gen_code(all_classes, iup_json_metadata, nimc, alt_ctors, iup_callbacks_json_metadata, iup_attrs_json_metadata)
    gen_misc(all_classes, nimc)


if __name__ == "__main__":
    main()
