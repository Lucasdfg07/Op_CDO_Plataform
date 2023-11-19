module Admin::LessonsHelper
  def lessons
    Lesson.all.order(id: :asc)
  end
end
