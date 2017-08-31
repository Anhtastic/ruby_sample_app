# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# RubySampleApp::Application.config.secret_key_base = '3860f87baeaf5a94adf9aff1e38edfea21222877c20b83d8004263237192f915d30ec86406c8aafc12504aaf373f260eea06063c813cef0e1a3f5e85579d33bf'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#Use existing token
		File.read(token_file).chomp
	else
		#Generate new token and store in token-file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

RubySampleApp::Application.config.secret_key_base = secure_token




