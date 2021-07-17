FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'abc000' }
    password_confirmation { password }
    surname               { 'あいう' }
    first_name            { '太郎' }
    kana_surname          { 'アイウ' }
    kana_first_name       { 'タロウ' }
    dob                   { '1970-02-05' }
  end
end
