class Article < ApplicationRecord
    has_many :comments
    has_rich_text :description
    has_one_attached :logo
    has_one_attached :banner
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 } 
end
