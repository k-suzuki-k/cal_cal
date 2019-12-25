require 'rails_helper'

describe "signup", type: :system, js: true do
  feature "登録機能" do
    let(:correct_user) { build(:user, email: 'oktest@gmail', password: 'password') }
    let(:user_without_info) { build(:user, email: '', password: '') }
    let(:late_user) { build(:user) }

    before do
      create(:user)
      visit root_path
      find(".show").find("#user_email").set(user_x.email)
      find(".show").find("#user_password").set(user_x.password)
      click_button "登録する"
    end

    context "有効なメールアドレスとパスワードで登録した場合" do
      let(:user_x) { correct_user }
      scenario "calender#showページに移動する" do
        expect(page).to have_current_path "/calender/2" #user_idの取得がわからないので直接urlに記入してます
      end
    end
    context "メールアドレス・パスワードを未入力でログインした場合" do
      let(:user_x) { user_without_info }
      scenario "login画面に戻る" do
        expect(page).to have_current_path welcome_path
      end
    end
    context "メールアドレスがすでに登録済みの場合" do
      let(:user_x) { late_user }
      scenario "login画面に戻る" do
        expect(page).to have_current_path welcome_path
      end
    end
  end
end
