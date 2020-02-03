class Pet < ApplicationRecord
  validates_presence_of :image, :name, :age, :description, :sex, :shelter_id, :status
  belongs_to :shelter
end
