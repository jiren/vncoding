# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

Mime::Type.register "video/mp4", :m4v
Mime::Type.register "video/x-flvmp4", :flv
MIME::Types.add(MIME::Type.from_array("video/mp4", %(m4v)))
