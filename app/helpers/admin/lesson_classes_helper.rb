module Admin::LessonClassesHelper
  def lesson_classes
    LessonClass.all.order(id: :asc)
  end
end
