class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
