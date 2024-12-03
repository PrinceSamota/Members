# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

cipher = OpenSSL::Cipher.new('AES-128-CBC') 
@secret = ENV['SECRET_KEY_BASE'] || 'a_secure_16_byte_key'