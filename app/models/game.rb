class Game < ApplicationRecord

    validates :name, :category, presence: true
    validates :name, uniqueness: true
    validates :rating, inclusion: {in: 0..100}
    validates :parent_id, presence:true, if: :category_is_expansion?

    private
    def category_is_expansion?
        category = self.category 
        if category == "main_game"
            return false
        end
        parent_id = self.parent_id
        Game.find_by(name: parent_id)  
    end

    has_and_belongs_to_many :platforms
    has_and_belongs_to_many :genres
    has_many :involved_companies
    has_many :companies, through: :involved_companies
    has_many :expansions, dependent: :delete_all, class_name: "Game", foreign_key: "parent_id"
    belongs_to :parent, class_name: "Game", optional: true
    has_many :reviews, as: :reviewable
    enum category: {main_game: 0, expansion: 1}

end
