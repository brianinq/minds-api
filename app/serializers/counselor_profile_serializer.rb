class CounselorProfileSerializer < ActiveModel::Serializer
  attributes :id, :specialization, :verified, :bio, :experience, :name, :avatar
  belongs_to :user
  has_many :appointments
  has_many :sessions
  has_many :reviews

  def name
    object.user.name
  end
  def avatar
    object.user.avatar
  end
end
