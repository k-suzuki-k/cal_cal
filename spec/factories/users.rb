FactoryBot.define do
  factory :user do
    email { 'tester@gmail' }
    name { '' }
    profile { '' }
    password { 'password' }

    trait :no_email do
      email { '' }
    end

    trait :no_password do
      password { '' }
    end

    trait :not_enough_password do
      password { '12345' }
    end
  end
end
