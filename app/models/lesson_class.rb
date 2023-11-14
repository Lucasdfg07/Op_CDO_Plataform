class LessonClass < ApplicationRecord
  validates :title, length: { maximum: 30 }
  validates :description, length: { maximum: 50 }

  has_one_attached :background

  scope :complementary_classes, -> () {
    where(complementary: true)
  }

  scope :main_classes, -> () {
    where(complementary: false)
  }
end
