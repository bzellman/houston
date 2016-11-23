class StaticPagesController < ApplicationController
  def home
    @signup = Signup.new
  end
end
