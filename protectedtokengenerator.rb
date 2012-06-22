require 'digest'
class ProtectedTokenGenerator
  attr_accessor :secret
  attr_accessor :protected_path
  attr_accessor :ip_limitation
  attr_reader   :protected_url
  attr_accessor :file_name
  
  
  def initialize
    @hex_time = Time.new.to_i.to_s(16)
    @remote_addr = ENV['REMOTE_ADDR']
    @hex_time = Time.new.to_i.to_s(16)
    @token = ''
  end
  
  def generate_path(file_name)
    if @ip_limitation
  	  @token = Digest::MD5.hexdigest(@secret + file_name + @hex_time + @remote_addr)
    else
  	  @token = Digest::MD5.hexdigest(@secret + file_name + @hex_time)
  	end
  	@protected_url = @protected_path + @token + '/' + @hex_time + '/' + file_name
  end

end