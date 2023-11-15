class Lesson < ApplicationRecord
  belongs_to :lesson_class

  validates :title, length: { maximum: 30 }
  validates :video_url, presence: true
end
