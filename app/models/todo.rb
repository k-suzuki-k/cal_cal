class Todo < ApplicationRecord
  # relation
  belongs_to :user

  # image upload
  mount_uploader :image, ImagesUploader
end
