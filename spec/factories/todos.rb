FactoryBot.define do
  factory :todo do
    user_id { 1 }
    day { "2019-12-14" }
    title { "MyString" }
    start_time { "2019-12-14 13:53:43" }
    end_time { "2019-12-14 13:53:43" }
    category { 1 }
    content { "MyText" }
    image { "MyString" }
  end
end
