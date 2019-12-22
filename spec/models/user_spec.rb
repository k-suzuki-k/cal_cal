require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ユーザ登録" do
    context "アドレスとパスワード6文字入力した場合" do
      it "有効な状態" do
        expect(build(:user)).to be_valid
      end
    end
    context "アドレスが未入力の場合" do
      it "無効な状態" do
        expect(build(:user, :no_email)).not_to be_valid
      end
    end
    context "パスワードが未入力の場合" do
      it "無効な状態" do
        expect(build(:user, :no_password)).not_to be_valid
      end
    end
    context "パスワードが5文字の場合" do
      it "無効な状態" do
        expect(build(:user, :not_enough_password)).not_to be_valid
      end
    end
    context "メールアドレスがすでに登録済みの場合" do
      it "無効な状態" do
        create(:user, email: "tester@gmail")
        expect(build(:user)).not_to be_valid
      end
    end

    describe "ユーザ情報の編集" do
      describe "ユーザ名" do
        context "20字" do
          it "有効な状態" do
            expect(build(:user, :max_name)).to be_valid
          end
        end
        context "21字" do
          it "無効な状態" do
            expect(build(:user, :over_name)).not_to be_valid
          end
        end
      end
      describe "自己紹介" do
        context "100字" do
          it "有効な状態" do
            expect(build(:user, :max_profile)).to be_valid
          end
        end
        context "101字" do
          it "無効な状態" do
            expect(build(:user, :over_profile)).not_to be_valid
          end
        end
      end
    end
  end
end
