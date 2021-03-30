class User < ActiveRecord::Base
    has_secure_password
    has_many :cocktails

    validates :name, presence: true
    validates :birthday, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :email, uniqueness: true
end