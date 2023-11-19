class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(permitted_params)

    if @category.save
      redirect_to admin_home_index_path, notice: t('platform.category.new.success')
    else
      flash[:alert] = @category.errors.full_messages.join(', ')
      redirect_to new_admin_category_path
    end
  end

  def edit
  end

  def update
    if @category.update(permitted_params)
      redirect_to admin_home_index_path
    else
      render request.referrer
    end
  end

  def destroy
    @category.destroy
    redirect_to request.referrer
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def permitted_params
    params.require(:category).permit(:title)
  end
end
