module LessonClassesHelper
  def main_lesson_classes
    LessonClass.main_classes
  end

  def complementary_lesson_classes
    LessonClass.complementary_classes
  end
end
