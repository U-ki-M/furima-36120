class SaleShipment
  include ActiveModel::Model
    attr_accessor :postal, :from_id, :city, :street, :bldg, :tel, :sale_id, :user_id, :item_id

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :tel, format: {with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :item_id
    
  end
  validates :from_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    sale = Sale.create(item_id: item_id, user_id: user_id)
    Shipment.create(postal: postal, from_id: from_id, city: city, street: street, bldg: bldg, tel: tel, sale_id: sale.id)
  end


end