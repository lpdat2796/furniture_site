class User::BaseController < ApplicationController
  layout 'application_user'
  before_action :set_data

  def set_data
    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: nil, is_public: true)
    @new_products = Product.joins(:categories).where(categories: { name: 'New furniture', parent_id: nil }, is_public: true)
    @trendy_products = Product.joins(:categories).where(categories: { name: 'Trendy', parent_id: nil }, is_public: true)
    @banners = Banner.where(is_public: true).order(sort_order: :desc).limit(3)
  end
end