class Article < ApplicationRecord
  belongs_to :auth
  validates :title, presence: true, length: {minimum:5, maximum:25}
  validates :content, presence: true, length: {minimum:50, maximum:1000}
  before_save { |article| article.title=article.title.upcase }
  before_save { |article| article.content=article.content.capitalize }
end
