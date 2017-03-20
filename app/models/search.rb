class Search < ApplicationRecord
  def search_products
    products = Product.all

    products = products.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present?
    products = products.where('price > ? AND price < ?', min_price, Product.maximum("price")) if min_price.present?
    products = products.where('price > ? AND price < ?', Product.minimum("price"), max_price) if max_price.present?
    products = products.where('price > ? AND price < ?', min_price, max_price) if (min_price && max_price).present?

    return products
  end
end
