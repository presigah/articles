class User < ApplicationRecord
    has_many :articles
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :name, :password, presence: true  
end
