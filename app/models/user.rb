class User < ActiveRecord::Base
  has_many :courses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  def timeout_in
    if self.admin?
      10.minutes
    else
      15.minutes
    end
  end



end
