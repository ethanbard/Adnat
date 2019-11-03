class User < ApplicationRecord
    validates :name, presence: true
    validates :email_address, presence: true
    validates :password, presence: true, length: { minimum: 6 }, confirmation: { case_sensitive: true}
end
