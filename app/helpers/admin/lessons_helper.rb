module Admin::LessonsHelper
  def lesson_classes
    LessonClass.all
  end
end
