module LessonsHelper
  def recommended_lesson_classes
    LessonClass.recommended_classes
  end

  def next_lesson
    Lesson.find_by(id: @lesson.id + 1)
  end

  def previous_lesson
    Lesson.find_by(id: @lesson.id - 1)
  end
end
