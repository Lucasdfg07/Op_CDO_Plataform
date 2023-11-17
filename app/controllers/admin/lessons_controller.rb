require 'byebug'

class Admin::LessonsController < ApplicationController
  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(permitted_params)

    if @lesson.save
      redirect_to lesson_class_lesson_path(permitted_params[:lesson_class_id], @lesson.id), notice: t('platform.lesson.new.success')
    else
      redirect_to :edit, alert: t('platform.lesson.new.error')
    end
  end

  private

  def permitted_params
    params.require(:lesson).permit(:lesson_class_id, :title, :video_url, :description)
  end
end
