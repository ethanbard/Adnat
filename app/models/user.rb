class User < ApplicationRecord
    #belongs_to :organization
    validates :password, presence: true, length: { minimum: 6 }
end
