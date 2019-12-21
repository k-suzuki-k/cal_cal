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
end
