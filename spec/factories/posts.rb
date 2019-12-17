FactoryBot.define do
  factory :post do
    user_id { 1 }
    day { "2019-12-17" }
    title { "MyString" }
    content { "MyText" }
  end
end
