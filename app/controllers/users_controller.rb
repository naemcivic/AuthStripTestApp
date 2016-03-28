class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
    @subscribers = Subscription.where('plan_id > ?', 1)
    @all_admins = User.where(admin: true)
  end
end
