class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #skip verification for testing on postman
  skip_before_action :verify_authenticity_token
end
