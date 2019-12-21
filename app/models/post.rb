class Post < ApplicationRecord
  # relation
  belongs_to :user

  # 日付は空でないこと
  validates :day, presence: true

  # postの検索
  scope :post_search, -> (search_params) do
     day_search(search_params[:day])
      .title_search(search_params[:title])
      .content_search(search_params[:content])
   end

  scope :day_search, -> (day)   {
     where(['day = ?', "#{day}"]) if day.present?
  }
  scope :title_search, -> (title)   {
     where(['title like ?', "%#{title}%"]) if title.present?
  }
  scope :content_search, -> (content)   {
     where(['content like ?', "%#{content}%"]) if content.present?
  }

end
