class LessonClass < ApplicationRecord
  validates :title, length: { maximum: 30 }
  validates :description, length: { maximum: 50 }
end
