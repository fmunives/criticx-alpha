class InvolvedCompany < ApplicationRecord
  validates :developer, :publisher, inclusion: {in: [true, false]}
  
  belongs_to :company
  belongs_to :game
end
