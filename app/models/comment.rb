class Comment < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :description, length: { maximum: 200 }
end
