class ErrorSerializer < ActiveModel::Serializer
  attributes :reply

  def reply
    object
  end
end
