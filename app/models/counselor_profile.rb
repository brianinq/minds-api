class CounselorProfile < ApplicationRecord
    belongs_to :user
    has_many :appointments
    has_many :sessions
    has_many :reviews
end
