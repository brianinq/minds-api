class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :counselor_profile_id, :time, :topic, :title, :description, :location, :approved
  belongs_to :counselor_profile
end
