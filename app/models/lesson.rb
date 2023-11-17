class Lesson < ApplicationRecord
  belongs_to :lesson_class
  has_many :concluded_lessons

  validates :title, length: { maximum: 30 }
  has_rich_text :description

  scope :concluded_by, -> (user) {
    joins(:concluded_lessons).where(concluded_lessons: { user_id: user.id })
  }
end
