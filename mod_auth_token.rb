#!ruby

require 'digest'
require 'yaml'
require './protectedtokengenerator.rb'

config = YAML.load_file("mod_auth_token.yml")
  secret				 = config[:secret]
  protected_path = config[:protected_path]
  ip_limitation	 = config[:ip_limitation]

new_token = ProtectedTokenGenerator.new
new_token.secret = config[:secret]
new_token.protected_path = config[:protected_path]
new_token.ip_limitation = config[:ip_limitation]
new_token.file_name = "smith.ttf"

puts new_token.generate_path("smith.ttf")

puts new_token.inspect