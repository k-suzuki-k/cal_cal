require 'rails_helper'

describe "login", type: :system, js: true do
  feature "ログイン機能" do
    let(:correct_user) { create(:user) }
    let(:user_without_info) { build(:user, email: '', password: '') }

    before do
      visit root_path
      all(".wv-tabs-header_tab")[1].click
      all("#user_email")[1].set(user_x.email)
      all("#user_password")[1].set(user_x.password)
      click_on "ログイン"
    end

    context "有効なメールアドレスとパスワードでログインした場合" do
      let(:user_x) { correct_user }
      scenario "calender#showページに移動する" do
        expect(page).to have_current_path "/calender/1"
      end
    end
    context "メールアドレス・パスワードを未入力でログインした場合" do
      let(:user_x) { user_without_info }
      scenario "login画面に戻る" do
        expect(page).to have_current_path welcome_path
      end
    end
  end
end
