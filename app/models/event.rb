class Event < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments

  validates :name, presence: :true
  validates :lat, presence: :true
  validates :lng, presence: :true
end
