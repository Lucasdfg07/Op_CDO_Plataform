class Admin::LessonsController < ApplicationController
  before_action :set_lesson, only: [:edit, :update, :destroy]

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(permitted_params)

    if @lesson.save
      redirect_to admin_home_index_path, notice: t('platform.lesson.new.success')
    else
      flash[:alert] = @lesson_class.errors.full_messages.join(', ')
      redirect_to new_admin_lesson_path
    end
  end

  def edit
  end

  def update
    if @lesson.update(permitted_params)
      redirect_to admin_home_index_path
    else
      render request.referrer
    end
  end

  def destroy
    @lesson.destroy
    redirect_to request.referrer
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def permitted_params
    params.require(:lesson).permit(:lesson_class_id, :title, :video_url, :description)
  end
end
