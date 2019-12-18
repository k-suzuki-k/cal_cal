class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # relation
  has_many :todos, dependent: :destroy
  has_many :posts, dependent: :destroy

  # 画像アップロードの設定
  mount_uploader :image, ImagesUploader

  # 1～20文字
    validates :name, length: {maximum: 20}
  # 1～100文字
    validates :profile, length: {maximum: 100}
end
