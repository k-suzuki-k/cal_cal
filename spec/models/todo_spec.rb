require 'rails_helper'

RSpec.describe Todo, type: :model do

  let(:test_user) { create(:user) }

  describe "Todoの日付(day)の入力" do
    context "日付がdate型の場合" do
      it "有効な状態" do
        expect(build(:todo, user: test_user)).to be_valid
      end
    end
    context "日付がdate型でない場合" do
      it "無効な状態" do
        expect(build(:todo, :not_date_format, user: test_user)).not_to be_valid
      end
    end
    context "日付が空の場合" do
      it "無効な状態" do
        expect(build(:todo, :no_date, user: test_user)).not_to be_valid
      end
    end
  end

  describe "Todoの時間(start_time)の入力" do
    context "時間がtime型の場合" do
      it "有効な状態" do
        expect(build(:todo, user: test_user)).to be_valid
      end
    end
    context "時間がtime型でない場合" do
      it "時間がnilになる" do
        todo = build(:todo, :not_time_format, user: test_user)
        expect(todo.start_time).to be nil
      end
    end
  end

end
