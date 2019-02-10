class User < ApplicationRecord
  has_many :comments
  has_many :events, through: :comments

  validates :name, presence: :true
  validates :email, presence: :true
  validates :password, presence: :true
end
