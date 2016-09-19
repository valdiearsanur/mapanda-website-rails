class AdminController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login
    user = AdminLogin.new do |u|
      u.name = "David"
      u.occupation = "Code Artist"
    end
  end

  def index
  end

  def portofolio
  end
end
