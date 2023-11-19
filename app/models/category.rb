class Category < ApplicationRecord
  has_many :lesson_classes
  validates :title, presence: true
end
