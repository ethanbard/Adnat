class Shift < ApplicationRecord
    validates :finish, presence: true
    validates :break_length, presence: true, numericality: true
end