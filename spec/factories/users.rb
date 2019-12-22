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

    trait :max_name do
      name { '11111111111111111111' }
    end
    trait :over_name do
      name { '111111111111111111110' }
    end

    trait :max_profile do
      profile { (0...100).map{ (65 + rand(26)).chr }.join }
    end
    trait :over_profile do
      profile { (0...101).map{ (65 + rand(26)).chr }.join }
    end
  end
end
