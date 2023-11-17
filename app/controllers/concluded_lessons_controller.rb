class ConcludedLessonsController < ApplicationController
  before_action :set_concluded_lesson, only: [:destroy]

  def create
    @concluded_lesson = ConcludedLesson.new(concluded_lesson_params)
    
    if @concluded_lesson.save!
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def destroy
    @concluded_lesson.destroy
    redirect_to request.referrer
  end

  private

  def set_concluded_lesson
    @concluded_lesson = ConcludedLesson.find(params[:concluded_lesson_id])
  end

  def concluded_lesson_params
    params.permit(:user_id, :lesson_id)
  end
end
