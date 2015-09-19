# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#Braintree stuff
Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "m394ydq9rdhw5x7x"
Braintree::Configuration.public_key = "7cb3k4mh7tf4xsz3"
Braintree::Configuration.private_key = "459cc3ebeab25a32d96ab65943e5925f"