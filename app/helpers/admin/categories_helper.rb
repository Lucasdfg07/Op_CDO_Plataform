module Admin::CategoriesHelper
  def categories
    Category.all.order(id: :asc)
  end
end
