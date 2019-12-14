class Todo < ApplicationRecord
  # relation
  belongs_to :user

  # image upload
  mount_uploader :image, ImagesUploader

  # category setting
  enum category: { work: 0, priv: 1 }
end
