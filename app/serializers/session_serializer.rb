class SessionSerializer < ActiveModel::Serializer
  attributes :id, :counselor_profile_id, :time, :title, :description, :maximum, :location, :topic
  belongs_to :counselor_profile

  # def profile_reviews
  #   object.counselor_profile.reviews
  # end
end
