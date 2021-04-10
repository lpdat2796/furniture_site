class Category < ApplicationRecord
  # Associations
  has_many :category_products
  has_many :products, through: :category_products

  # Callbacks
  before_save :set_parent_id

  private
  
  def set_parent_id
    if parent_id.blank?
      self.parent_id = '0'
    else
      parent_category = Category.find_by(id: parent_id)
      
      if parent_category.present?
        self.parent_id = parent_category.parent_id + ',' + parent_id
      else
        self.parent_id = '0'
      end
    end
  end
end