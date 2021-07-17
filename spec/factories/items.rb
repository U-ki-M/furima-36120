FactoryBot.define do
  factory :item do
    title              { 'test' }
    description        { 'testtest' }
    category_id        { 2 }
    condition_id       { 2 }
    fee_by_id          { 2 }
    from_id            { 2 }
    timeline_id        { 2 }
    price              { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
