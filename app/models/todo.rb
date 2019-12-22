class Todo < ApplicationRecord
  # relation
  belongs_to :user

  # image upload
  mount_uploader :image, ImagesUploader

  # categoryの設定
  enum category: { work: 0, prive: 1 }

  # 日付は空でないこと
  validates :day, presence: true

  # todolistの検索
  scope :user_todo_list, -> (user_id,search_day) {
    where(user_id: "#{user_id}").where(day: "#{search_day}")
  }
  # todolistを時間をもとに昇順に並べる
  scope :order_todo_list, ->  {
    order(:start_time).order(:end_time)
  }
end
