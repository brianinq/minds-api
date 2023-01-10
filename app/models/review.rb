class Review < ApplicationRecord
    belongs_to :user
    belongs_to :counselor_profile
end
