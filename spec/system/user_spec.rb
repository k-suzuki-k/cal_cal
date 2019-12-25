require 'rails_helper'

describe "user", type: :system, js: true do

  feature "ユーザ情報の編集機能" do

    describe "ユーザ本人の場合" do
      let(:login_user) { create(:user) }
      before do
        sign_in login_user
        visit calender_path login_user
        find('.drawer-toggle').click
        find('a', text: "プロフィール設定").click
      end
      context "編集が成功した場合" do
        scenario "calender_pathでflashメッセージが表示される " do
          find('#user_name').set("I_am_user")
          click_on "変更する"
          expect(page).to have_current_path calender_path login_user
          expect(page).to have_content "プロフィールの変更が完了しました。"
        end
      end
      context "編集が失敗した場合" do
        scenario "編集画面でflashメッセージが表示される" do
          find('#user_name').set("111111111111111111110") # 文字数のバリデーションエラー
          click_on "変更する"
          expect(page).to have_current_path edit_user_path login_user
          expect(page).to have_content "プロフィールの変更に失敗しました。"
        end
      end
    end

    describe "ユーザ本人でない場合" do
      context "他人の編集画面にアクセスした場合" do
        scenario "calender_pathへ戻される" do
          user = create(:user)
          other_user = create(:user, email: "other@gmail")
          sign_in user
          visit edit_user_path other_user
          expect(page).to have_current_path calender_path user
        end
      end
    end
  end
end
