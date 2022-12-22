class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: {case_Sensitive: false}
    has_many :counselor_profiles
    has_many :appointments
    has_many :reviews
end
