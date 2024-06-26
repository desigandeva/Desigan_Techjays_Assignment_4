class Auth < ApplicationRecord
  # assign role
  # user => 0
  # editor => 1
  # admin => 2
  enum role: { user: 0, editor: 1, admin: 2 }
  # auth has many article's
  has_many :articles, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
