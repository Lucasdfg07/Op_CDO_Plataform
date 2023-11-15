class LessonClass < ApplicationRecord
  has_many :lessons

  validates :title, length: { maximum: 30 }
  validates :description, length: { maximum: 50 }

  has_one_attached :background

  scope :complementary_classes, -> () {
    where(complementary: true)
  }

  scope :main_classes, -> () {
    where(complementary: false)
  }

  scope :recommended_classes, -> () {
    order('RANDOM()').limit(6)
  }
end
