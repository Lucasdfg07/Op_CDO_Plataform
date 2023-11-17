class Admin::LessonClassesController < ApplicationController
  def new
    @lesson_class = LessonClass.new
  end

  def create
    @lesson_class = LessonClass.new(permitted_params)

    if @lesson_class.save
      redirect_to @lesson_class, notice: t('platform.lesson_class.new.success')
    else
      flash[:alert] = @lesson_class.errors.full_messages.join(', ')
      redirect_to new_admin_lesson_class_path
    end
  end

  private

  def permitted_params
    params.require(:lesson_class).permit(:title, :description, :complementary, :background)
  end
end
