require_relative "../../config/environment"
require_relative "../models/decision_maker.rb"
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "decision_maker"
  end
  
  get '/' do  
    erb :index
  end
  
  post '/results' do
    @o1 = params[:option1]
    @o2 = params[:option2]
    @o3 = params[:option3]
    @o4 = params[:option4]
    @o5 = params[:option5]
    @item = make_decision(@o1, @o2, @o3, @o4, @o5)
    erb :results
  end
  
end