class Recipe < ApplicationRecord
    validates :name, presence:true
    validates :ingredients, presence:true
    validates :directions, presence:true
    validates :tags, presence:true
end
