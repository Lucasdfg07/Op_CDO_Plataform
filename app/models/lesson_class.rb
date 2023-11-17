class LessonClass < ApplicationRecord
  has_many :lessons

  validates :title, length: { maximum: 30 }
  validates :description, length: { maximum: 50 }

  validate :background_file_size
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

  private

  def background_file_size
    if background.attached? && background.blob.byte_size > 1.megabyte
      errors.add(:background, 'File size too large. Maximum size is 1MB.')
    end
  end
end
