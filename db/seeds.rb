# factory_botでテストデータを作成
require 'factory_bot_rails'
include FactoryBot::Syntax::Methods
FactoryBot.definition_file_paths = [ Rails.root.join('spec', 'factories') ]

10.times do
  create(:seed_user, :with_todos_and_posts)
end
