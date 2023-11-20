class LessonClass < ApplicationRecord
  has_many :lessons, dependent: :destroy
  belongs_to :category

  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 50 }

  validate :background_file_size
  has_one_attached :background
  validates :background, presence: true

  scope :recommended_classes, -> () {
    order('RANDOM()').limit(6)
  }

  private

  def background_file_size
    if background.attached? && background.blob.byte_size > 1.megabyte
      errors.add(:background, t('platform.lesson_class.fields.background.error'))
    end
  end
end
