class Employee < ApplicationRecord
  has_many :experiences, dependent: :destroy
  accepts_nested_attributes_for :experiences, allow_destroy: true


  has_one_attached :image
  has_one_attached :bgimage

end
