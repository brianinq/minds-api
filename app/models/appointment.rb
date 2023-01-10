class Appointment < ApplicationRecord
    belongs_to :counselor_profile
    belongs_to :user
end
