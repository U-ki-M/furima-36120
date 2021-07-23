class Item < ApplicationRecord
  belongs_to :user
  has_one    :sale
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :fee_by_id
    validates :from_id
    validates :timeline_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee_by
  belongs_to :from
  belongs_to :timeline
end
