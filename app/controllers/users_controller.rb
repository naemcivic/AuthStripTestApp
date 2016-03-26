class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = Users.all
  end


end
