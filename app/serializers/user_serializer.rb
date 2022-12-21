class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :avatar, :gender, :age, :is_cancellor
end
