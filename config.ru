# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Media::Application
#Sass::Plugin.options[:template_location] = { 'app/stylesheets' => 'public/stylesheets/compiled' }

