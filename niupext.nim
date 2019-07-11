import niup

template Open*() =
  var argc:cint=0
  var argv:cstringArray=nil
  discard niup.Open(argc, addr argv)

template InitConfig*(config:PIhandle, appName:string) =
  config = niup.Config()
  niup.SetAttribute(config, "APP_NAME", appName)
  discard niup.ConfigLoad(config)
