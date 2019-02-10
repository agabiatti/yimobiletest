class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :report

  validates :text, presence: :true
  validates :user_id, presence: :true
  validates :event_id, presence: :true

  scope :reported, -> { joins(:report) }
  scope :without_reported, -> { Comment.where.not(id: Report.select(:comment_id)) }
end
