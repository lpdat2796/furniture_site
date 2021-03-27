class User::ProductsController < User::BaseController
  def show
    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: nil, is_public: true)
    if params[:category_id].to_i > 0
      @category = Category.find(params[:category_id])
    end

    @product = Product.find(params[:id])
    @images = @product.product_images.order(sort_order: :desc)
    @related_products = Product.joins(:categories).where(categories: { id: @product.categories.ids }).where.not(id: @product.id).distinct
  end
end