template imcdCanvasPutImage*(x_canvas, x_image, x_x, x_y, x_w, x_h, x_xmin, x_xmax, x_ymin, x_ymax: untyped): void =
  if x_image.color_space == IM_RGB:
    if x_image.has_alpha > 0:
      cdCanvasPutImageRectRGBA(x_canvas, x_image.width, x_image.height,
                               cast[ptr uint8](cast[ByteAddress](x_image.data[]) +% 0 * x_image.plane_size),
                               cast[ptr uint8](cast[ByteAddress](x_image.data[]) +% 1 * x_image.plane_size),
                               cast[ptr uint8](cast[ByteAddress](x_image.data[]) +% 2 * x_image.plane_size),
                               cast[ptr uint8](cast[ByteAddress](x_image.data[]) +% 3 * x_image.plane_size), x_x, x_y, x_w, x_h,
                               x_xmin, x_xmax, x_ymin, x_ymax)
    else:
      cdCanvasPutImageRectRGB(x_canvas, x_image.width, x_image.height,
                              cast[ptr uint8](cast[ByteAddress](x_image.data[]) +% 0 * x_image.plane_size),
                              cast[ptr uint8](cast[ByteAddress](x_image.data[]) +% 1 * x_image.plane_size),
                              cast[ptr uint8](cast[ByteAddress](x_image.data[]) +% 2 * x_image.plane_size), x_x, x_y, x_w, x_h, x_xmin,
                              x_xmax, x_ymin, x_ymax)
  else:
    cdCanvasPutImageRectMap(x_canvas, x_image.width, x_image.height,
                            cast[ptr uint8](cast[ByteAddress](x_image.data[]) +% 0 * x_image.plane_size), x_image.palette, x_x,
                            x_y, x_w, x_h, x_xmin, x_xmax, x_ymin, x_ymax)

