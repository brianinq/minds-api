class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user, :comment
end
