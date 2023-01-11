class CounselorProfileSerializer < ActiveModel::Serializer
  attributes :id, :specialization, :verified, :bio, :experience, :name, :avatar, :reviews
  belongs_to :user
  has_many :appointments
  has_many :sessions

  def name
    object.user.name
  end
  def avatar
    object.user.avatar
  end
  def reviews
    object.reviews.where(approved: true)
  end
end
