FactoryBot.define do
  factory :todo do
    day { "2019-12-21" }
    start_time { "13:00" }
    end_time { "14:00" }
    association :user

    trait :not_date_format do
      day { "no date" }
    end

    trait :no_date do
      day { "" }
    end

    trait :not_time_format do
      start_time { "not time" }
    end
  end

  # seed用
  factory :seed_todo, class: Todo do
    day { Faker::Date.between(from: 1.week.ago, to: Date.today.since(3.days)) }
    title { ["買い物", "勉強", "読書", "映画", "会議", "出張申請"].sample }
    start_time { Faker::Time.between(from: "00:00", to: "22:00") }
    end_time { "#{start_time + 60 * 60}" } # start_timeの一時間後
    category { Faker::Number.between(from: 0, to: 1) }
    content {Faker::Job.field }
    association :user
  end
end
