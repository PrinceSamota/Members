class WelcomeController < ApplicationController
    before_action :authenticate_user!, only: [:index]  # or other actions you want to protect

  def index
    @user = User.all
  end
end
