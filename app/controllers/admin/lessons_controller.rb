require 'byebug'

class Admin::LessonsController < ApplicationController
  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(permitted_params)

    @lesson.video.url = params[:lesson][:video_url]

    if @lesson.save
      redirect_to root_path, notice: t('platform.lesson.new.success')
    else
      redirect_to :edit, alert: t('platform.lesson.new.error')
    end
  end

  private

  def permitted_params
    params.require(:lesson).permit(:lesson_class_id, :title)
  end
end
