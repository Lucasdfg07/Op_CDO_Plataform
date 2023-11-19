class Admin::LessonClassesController < Admin::AdminBaseController
  before_action :set_lesson_class, only: [:edit, :update, :destroy]

  def new
    @lesson_class = LessonClass.new
  end

  def create
    @lesson_class = LessonClass.new(permitted_params)

    if @lesson_class.save
      redirect_to admin_home_index_path, notice: t('platform.lesson_class.new.success')
    else
      flash[:alert] = @lesson_class.errors.full_messages.join(', ')
      redirect_to new_admin_lesson_class_path
    end
  end

  def edit
  end

  def update
    if @lesson_class.update(permitted_params)
      redirect_to admin_home_index_path
    else
      render request.referrer
    end
  end

  def destroy
    @lesson_class.destroy
    redirect_to request.referrer
  end

  private

  def set_lesson_class
    @lesson_class = LessonClass.find(params[:id])
  end

  def permitted_params
    params.require(:lesson_class).permit(:category_id, :title, :description, :background)
  end
end
