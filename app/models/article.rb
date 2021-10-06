class Article < ApplicationRecord
    has_many :comments
    has_rich_text :description
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
