class WelcomeController < ApplicationController
  def index
    @user = User.new
  end

  def about
  end
end
