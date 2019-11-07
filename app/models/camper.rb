class Camper < ApplicationRecord
  has_many :signups, dependent: :destroy
  has_many :activities, through: :signups

  # def activities

  # end
end
