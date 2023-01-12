class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :avatar, :gender, :age, :is_counselor, :is_admin
end
