class Todo < ApplicationRecord
  # relation
  belongs_to :user

  # image upload
  mount_uploader :image, ImagesUploader

  # categoryの設定
  enum category: { work: 0, prive: 1 }

  # 日付は空でないこと
  validates :day, presence: true
end
