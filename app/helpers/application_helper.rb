module ApplicationHelper
  def lessons_of(lesson_class)
    Lesson.where(lesson_class_id: lesson_class.id).order(id: :asc)
  end
end
