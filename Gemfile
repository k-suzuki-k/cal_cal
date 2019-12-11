source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # pry関連(デバッグなど便利)
  gem 'pry-rails'    # rails cの対話式コンソールがirbの代わりにリッチなpryになる
  gem 'pry-byebug'   # binding.pryをソースに記載すると、ブレイクポイントとなりデバッグが可能になる
  gem 'pry-stack_explorer' # pry中にスタックを上がったり下がったり行き来できる

  # 表示整形関連(ログなど見やすくなる)
  gem 'hirb'         # モデルの出力結果を表形式で表示する
  gem 'hirb-unicode' # hirbの日本語などマルチバイト文字の出力時の出力結果がすれる問題に対応
  gem 'rails-flog', require: 'flog' # HashとSQLのログを見やすく整形
  gem 'better_errors'     # 開発中のエラー画面をリッチにする
  gem 'binding_of_caller' # 開発中のエラー画面にさらに変数の値を表示する
  gem 'awesome_print'     # Rubyオブジェクトに色をつけて表示して見やすくなる

  # テスト関連
  gem "rspec-rails"        # rspec本体
  gem "shoulda-matchers"   # モデルのテストを簡易にかけるmatcherが使える
  gem 'factory_bot_rails'
  gem "test-queue"         # テストを並列で実行する
  gem 'faker'              # 本物っぽいテストデータの作成
  gem 'faker-japanese'     # 本物っぽいテストデータの作成（日本語対応）
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # 開発を効率化する関連
  gem 'guard-livereload', require: false # ソースを修正するとブラウザが自動でロードされ、画面を作るときに便利
  gem 'rails-erd'                        # rake-erdコマンドでActiveRecordからER図を作成できる
  gem 'spring-commands-rspec'            # bin/rspecコマンドを使えるようにし、rspecの起動を早めれる
  gem 'bullet'                           # n+1問題を発見
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
    gem 'mysql2'
end

# jqueryのイベントがturbolinkのせいで発火しなくなる問題を解消するgem
gem 'jquery-rails'
gem 'jquery-turbolinks'

# デザイン関連
gem 'bootstrap', '~> 4.4.1'
# アイコン
gem 'font-awesome-rails'
# slim
gem 'slim-rails'
gem 'html2slim'
# ページネーション
gem 'kaminari'

# login
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'

# 画像アップロード
gem 'carrierwave'
