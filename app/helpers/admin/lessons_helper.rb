module Admin::LessonsHelper
  def lesson_classes
    LessonClass.all.order(id: :asc)
  end

  def lessons
    Lesson.all.order(id: :asc)
  end
end
