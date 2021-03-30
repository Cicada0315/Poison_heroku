class Cocktail < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true
    validates :ingredient, presence: true
    validates :instruction, presence: true
end