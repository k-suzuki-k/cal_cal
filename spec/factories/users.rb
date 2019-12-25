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

  # seed用
  factory :seed_user, class: User do
    email { Faker::Internet.safe_email }
    name { Faker::Name.first_name }
    sequence(:profile) { |n| "#{n} よろしく!!" }
    password { 'password' }
    # factories/imagesにて事前に用意した画像を登録する
    sequence(:image) { |n| open("#{Rails.root}/spec/factories/images/#{n}.jpg") }

    # userの作成と同時にtodo&postを作成する
    trait :with_todos_and_posts do
      after(:create) { |user|
        create_list(:seed_todo, 30, user: user)
        create_list(:seed_post,  3, user: user)
      }
    end

    trait :with_5todos do
      after(:create) { |user|
        create_list(:todos_5, 5, user: user)
      }
    end
  end
end
