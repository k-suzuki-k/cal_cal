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
end
