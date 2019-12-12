class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 画像アップロードの設定
  mount_uploader :image, ImagesUploader

  # 1～20文字
    validates :name, length: {maximum: 20}
  # 1～100文字
    validates :profile, length: {maximum: 100}
end
