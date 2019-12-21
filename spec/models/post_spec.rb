require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:test_user) { create(:user) }

  describe "Postの日付(day)の入力" do
    context "日付がdate型の場合" do
      it "有効な状態" do
        expect(build(:post, user: test_user)).to be_valid
      end
    end
    context "日付がdate型でない場合" do
      it "無効な状態" do
        expect(build(:post, :not_date_format, user: test_user)).not_to be_valid
      end
    end
    context "日付が空の場合" do
      it "無効な状態" do
        expect(build(:post, :no_date, user: test_user)).not_to be_valid
      end
    end
  end
end
