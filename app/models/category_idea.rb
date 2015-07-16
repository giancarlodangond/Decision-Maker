require_relative "../../config/environment"

class CategoryIdea < ActiveRecord::Base
  belongs_to :category
  belongs_to :idea
end