require 'autoprefixer-rails'
# require 'compass/import-once/activate'
# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "/"

css_dir = "assets/css"
sass_dir = "assets/sass"
images_dir = "assets/img"
javascripts_dir = "assets/js"
fonts_dir = "assets/fonts"

# environment = :development

# :nested, :expanded, :compact, :compressed
output_style = :expanded


# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

line_comments = false
color_output = false

preferred_syntax = :sass


on_stylesheet_saved do |file|
	css = File.read(file)
	File.open(file, 'w') do |io|
		io << AutoprefixerRails.process(css, browsers: ['ie >= 9', 'ie_mob >= 10', 'ff >= 30', 'chrome >= 34', 'safari >= 7', 'opera >= 23', 'ios >= 7', 'android >= 4.4', 'bb >= 10'])
	end
end


# ===================
# Uncomment this part to make sprite name static, icons-123asda.png -> icons.png
# useful for diffs in screen.css
# ===================
# # Make a copy of sprites with a name that has no uniqueness of the hash.
# on_sprite_saved do |filename|
#   if File.exists?(filename)
#     FileUtils.cp filename, filename.gsub(%r{-s[a-z0-9]{10}\.png$}, '.png')
#   end
# end
# # Replace in stylesheets generated references to sprites
# # by their counterparts without the hash uniqueness.
# on_stylesheet_saved do |filename|
#   if File.exists?(filename)
#     css = File.read filename
#     File.open(filename, 'w+') do |f|
#       f << css.gsub(%r{-s[a-z0-9]{10}\.png}, '.png')
#     end
#   end
# end

# # this one for switching between production and dev versions of the website
# module Sass::Script::Functions
#   def image_path(string)
#     assert_type string, :String
#     Sass::Script::String.new("../img/#{string.value}")
#   end
#   alias_method :"image-path",:image_path
#   declare :"image-path", :args => [:string]
# end
#
# php -S localhost:8000