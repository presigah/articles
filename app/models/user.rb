class User < ApplicationRecord
    has_many :articles
    has_secure_password
    has_one_attached :avatar

    validates :email, presence: true, uniqueness: true
    validates :name, :password, presence: true  
end
