class Place < ApplicationRecord
  validates :name, presence: true, length: { maximum: 140, minimum: 3 }
  validates :address, presence: true, length: { maximum: 150, minimum: 3 }
  validates :description, presence: true, length: { maximum: 300, minimum: 3 }

  belongs_to :user
end
