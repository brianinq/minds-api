class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :avatar, :gender, :age, :is_counselor, :is_admin, :counselor_profile
  
  def counselor_profile
    if object.is_counselor
      profile = CounselorProfile.where(user_id: object.id)
      return profile
    end
  end
end
