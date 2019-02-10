class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :lat, :lng
end