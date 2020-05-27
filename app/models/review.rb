class Review < ApplicationRecord

  validates :title, :body, presence: true
  validates :title, uniqueness: true, length: {maximum: 40}

  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  after_create :increase_review_count
  after_destroy :decrease_review_count
   
   private

   def increase_review_count
    value_review_count =  self.user.review_count
    if !value_review_count
      value_review_count = 0
    end
    self.user.update(review_count: value_review_count + 1 )
    end

    def decrease_review_count
      value_review_count =  self.user.review_count
      if value_review_count
        self.user.update(review_count: value_review_count - 1 )
     end
    end


end
