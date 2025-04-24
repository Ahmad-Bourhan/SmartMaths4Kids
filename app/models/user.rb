class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :scores, dependent: :destroy
  has_one :profile, dependent: :destroy
  def admin?
    role == "admin"
  end

  def regular?
    role == "user"
  end

end
