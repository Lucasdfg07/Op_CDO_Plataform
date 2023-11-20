module LessonsHelper  
  def recommended_lesson_classes
    LessonClass.recommended_classes
  end

  def next_lesson
    Lesson.where("id > ? AND lesson_class_id = ?", @lesson.id, @lesson.lesson_class_id).order(id: :asc).first
  end
  
  def previous_lesson
    Lesson.where("id < ? AND lesson_class_id = ?", @lesson.id, @lesson.lesson_class_id).order(id: :desc).first
  end

  def new_concluded_lesson
    ConcludedLesson.new
  end

  def concluded_lesson(user, lesson)
    ConcludedLesson.find_by(user_id: user.id, lesson_id: lesson.id)
  end

  def lesson_concluded_by_user?(lesson)
    lesson.in? Lesson.concluded_by(current_user)
  end

  def lessons_of_parent_lesson_class
    @lesson.lesson_class.lessons
  end
end
