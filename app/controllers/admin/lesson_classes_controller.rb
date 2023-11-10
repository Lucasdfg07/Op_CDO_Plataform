require 'byebug'
class Admin::LessonClassesController < ApplicationController
  def new
    @lesson_class = LessonClass.new
  end

  def create
    @lesson_class = LessonClass.new(permitted_params)

    if @lesson_class.save
      redirect_to root_path, notice: t('platform.lesson_class.new.success')
    else
      redirect_to :edit, alert: t('platform.lesson_class.new.error')
    end
  end

  private

  def permitted_params
    params.require(:lesson_class).permit(:title, :description, :complementary, :background)
  end
end
