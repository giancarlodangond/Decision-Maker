require_relative "../../config/environment"

class Idea < ActiveRecord::Base
  has_many :category_ideas
  has_many :categories, :through => :category_ideas
end