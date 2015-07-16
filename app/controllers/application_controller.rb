require_relative "../../config/environment"
require_relative '../models/decision_maker.rb'
require_relative '../models/idea.rb'
require_relative '../models/category.rb'
require_relative '../models/category_idea.rb'
require "pry"
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "decision_maker"
  end
  
  get '/' do  
    @categories = Category.all 
    erb :index
  end
  
  post '/' do
    Category.create(:name => params[:suggestion])
    redirect '/'
  end
  
  post '/results' do
    @category = Category.find_by(:name => params[:category])
    @end_suggestion = @category.ideas[rand(@category.ideas.length)]
    @o1 = params[:option1]
    @o2 = params[:option2]
    @o3 = params[:option3]
    @o4 = params[:option4]
    @o5 = params[:option5]
    @item = make_decision(@o1, @o2, @o3, @o4, @o5)
    @idea1 = Idea.find_or_create_by(:name => @o1)
    @idea2 = Idea.find_or_create_by(:name => @o2)
    @idea3 = Idea.find_or_create_by(:name => @o3)
    @idea4 = Idea.find_or_create_by(:name => @o4)
    @idea5 = Idea.find_or_create_by(:name => @o5)
    while @end_suggestion == @idea1 || @end_suggestion == @idea2 || @end_suggestion == @idea3 || @end_suggestion == @idea4 || @end_suggestion == @idea5
      @end_suggestion = @category.ideas[rand(@category.ideas.length)]
    end
#     binding.pry
    CategoryIdea.create(:idea_id => @idea1.id, :category_id => @category.id)
    CategoryIdea.create(:idea_id => @idea2.id, :category_id => @category.id)
    CategoryIdea.create(:idea_id => @idea3.id, :category_id => @category.id)
    CategoryIdea.create(:idea_id => @idea4.id, :category_id => @category.id)
    CategoryIdea.create(:idea_id => @idea5.id, :category_id => @category.id)
    erb :results
  end
  
end