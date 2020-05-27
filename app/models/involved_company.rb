class InvolvedCompany < ApplicationRecord
  validates :developer, :publisher, presence: true
  
  belongs_to :company
  belongs_to :game
end
