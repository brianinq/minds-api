class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: {case_Sensitive: false}
end
