FactoryBot.define do
  factory :post do
    day { "2019-12-17" }
    association :user

    trait :not_date_format do
      day { "not date" }
    end

    trait :no_date do
      day { "" }
    end
  end

  # seed用
  factory :seed_post, class: Post do
    day { Faker::Date.between(from: 1.week.ago, to: Date.today.since(3.days)) }
    title { ["休日の過ごし方", "旅行",  "出張"].sample }
    content { ["楽しかった", "最悪な一日、、",  "無駄な一日、、", "リフレッシュできた"].sample }
    association :user
  end
end
