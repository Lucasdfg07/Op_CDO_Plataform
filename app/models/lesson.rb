class Lesson < ApplicationRecord
  belongs_to :lesson_class

  validates :title, length: { maximum: 30 }

  has_one_attached :video
end
