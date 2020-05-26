require 'date'

class User < ApplicationRecord
    validates :email, :username, uniqueness: true, presence: true
    validates :my_year, inclusion: {in: (Date.today.year - 100)..(Date.today.year - 16), message: 'You should be 16 years old to create an account' }

    private
    def my_year
        self.birth_date.year
    end
    
    has_many :reviews
end
