require '../protectedtokengenerator.rb'
require 'digest'
require 'yaml'

config = YAML.load_file("../mod_auth_token.yml")
  secret				 = config[:secret]
  protected_path = config[:protected_path]
  ip_limitation	 = config[:ip_limitation]
  filename = 'metallica.jpg'
  
describe ProtectedTokenGenerator do
  before :each do
    @protected_token = ProtectedTokenGenerator.new('secret', 'path', 'ip_limitation')
  end
  
  describe "#new" do
    it "takes three parameters and returns a ProtectedTokenGenerator object" do
      @protected_token.should be_an_instance_of ProtectedTokenGenerator
      end
    end
    
  describe "#generate_path" do
    it "takes a file name parameter and returns a protected path" do
      @protected_token = ProtectedTokenGenerator.new(secret, protected_path, ip_limitation)
      @protected_token.generate_path(filename).should match  /^\/downloads\/[a-fA-F0-9]{32}\/[a-fA-F0-9]{8}\/metallica.jpg$/
    end
  end     
end