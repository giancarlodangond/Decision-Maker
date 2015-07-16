require_relative "../../config/environment"

class Category < ActiveRecord::Base
  has_many :category_ideas
  has_many :ideas, :through => :category_ideas
end