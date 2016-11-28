class ApplicationController < ActionController::Base
  include Clearance::Controller
  include UsersHelper
  protect_from_forgery with: :exception
end
