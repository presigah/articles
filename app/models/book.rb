class Book < ApplicationRecord
    has_one_attached :cover_page
    has_rich_text :abstract
    has_one_attached :book
    has_many :reviews
    validates :title, presence: true
    validates :price, presence: true, numericality: { greater_than: 0, less_than: 1000000 }
    validates :author_first_name, :author_last_name, presence: true
    validates :author_email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Incorrect email format" }
    validates :author_job_title, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :book, attached: true, content_type: { in: 'application/pdf', message: 'is not a PDF' }
    validates :abstract, presence: true
end
    