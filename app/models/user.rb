class User < ActiveRecord::Base
# Added by Koudoku.
  has_one :subscription

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Define method for Devise to have a user timeout in a specific interval       
  def timeout_in
    if self.admin?
      10.minutes
    else
      15.minutes
    end
  end

  # Define method to find out if member is a subscriber
  def subscriber?
    self.subscription.plan_id != nil && self.subscription.plan_id >= 1
  end

end
