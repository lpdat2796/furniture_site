module ApplicationHelper
  def subcat_prefix(depth)
    ("&nbsp;" * 4 * depth).html_safe
   end
  
   def category_options_array(original_categories, current_id = 0,categories = [], parent_id = '0', depth = 0)
    original_categories.where('parent_id LIKE ? AND id != ?', "%#{ parent_id }%", current_id ).order(:id).each do |category|
      next if depth == 0 && category.parent_id.split(',').length > 1
      categories << [subcat_prefix(depth) + category.name, category.id]
      category_options_array(original_categories, current_id, categories, category.id, depth + 1)
    end
  
    categories
  end
end
