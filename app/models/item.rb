class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :shipping_area

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    
    with_options numericality:  {only_integer: true, greater_than_or_equal_to: 1} do
      validates :category_id
      validates :condition_id
      validates :postage_type_id
      validates :preparation_day_id
      validates :shipping_area_id
    end
    
    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
      validates :price, format: { with: /\A[0-9]+\z/ }
    end
  end
end