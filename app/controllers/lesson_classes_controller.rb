class LessonClassesController < ApplicationController
  before_action :set_lesson_class, only: [:show]

  private

  def set_lesson_class
    @lesson_class = LessonClass.find(params[:id])
  end
end
