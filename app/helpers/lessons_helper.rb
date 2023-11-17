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

  def new_concluded_lesson
    ConcludedLesson.new
  end

  def concluded_lesson(user, lesson)
    ConcludedLesson.find_by(user_id: user.id, lesson_id: lesson.id)
  end

  def lesson_concluded_by_user?
    @lesson.in? Lesson.concluded_by(current_user)
  end
end
