FactoryBot.define do
  factory :sale_shipment do
    token { 'tok_abcdefghijk00000000000000000' }
    postal { '123-4567' }
    from_id { 2 }
    city { '大阪市' }
    street { '1-90' }
    bldg { 'メゾンポルタ' }
    tel { '09012341234' }
    association :user
    association :item
  end
end
