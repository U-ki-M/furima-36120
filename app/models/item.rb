class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :image,        presence: true
  validates :title,        presence: true
  validates :description,  presence: true
  validates :price,        presence: true
  validates :category_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_by_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :from_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :timeline_id,  numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee_by
  belongs_to :from
  belongs_to :timeline

end
