require 'date'

class User < ApplicationRecord

    has_secure_password

    validates :email, :username, uniqueness: true, presence: true
    validates :my_year, numericality: { less_than: Date.today.year - 16, message: 'You should be 16 years old to create an account'  }
 
    private
    def my_year
        self.birth_date.year
    end
    
    has_many :reviews
end
