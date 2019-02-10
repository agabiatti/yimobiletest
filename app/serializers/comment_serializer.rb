class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :event_id
  belongs_to :user
  belongs_to :event
end