class Shipment < ApplicationRecord
  belongs_to :sale

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :from
end
