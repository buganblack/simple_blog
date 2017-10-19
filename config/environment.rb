# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ADMIN_USERNAME = Figaro.env.admin_username
ADMIN_PASSWORD = Figaro.env.admin_password
