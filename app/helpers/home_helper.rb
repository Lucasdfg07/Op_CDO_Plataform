module HomeHelper
  def categories
    Category.all.order(id: :asc)
  end
end
