class LessonClass < ApplicationRecord
  validates :title, length: { maximum: 30 }
  validates :description, length: { maximum: 50 }

  has_one_attached :background

  # TODO:
  # Create controllers and connect ActiveStorage with views
  # Letting the following example how to do It:
  # 
  # Controller:
  # lesson_class = LessonClass.new(title: 'Exemplo de Aula')
  # lesson_class.background.attach(io: File.open('path/to/your/image.jpg'), filename: 'image.jpg')
  # lesson_class.save
  # 
  # Views:
  # <%= image_tag rails_blob_path(lesson_class.background, disposition: "attachment"), alt: "Lesson Class Image" %>
end
