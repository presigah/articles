class Book < ApplicationRecord
    has_one_attached :cover_page
    has_one_attached :book
    has_many :reviews
    
    validates :book, attached: true, content_type: { in: 'application/pdf', message: 'is not a PDF' }
end
    