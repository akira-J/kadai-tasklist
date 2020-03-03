class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true
  validates :email, presence: true,
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                  uniqueness: { case_sensitive: false }
  validates :password, presence: true
  
  has_secure_password

  has_many :tasks
end
