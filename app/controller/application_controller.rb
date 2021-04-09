require 'sinatra/base'
require 'rack-flash'
class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        set :public_folder, 'public' 
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
        use Rack::Flash, :sweep => true
    end

    get '/' do
        erb :welcome
    end

    get '/about' do
        erb :about
    end

    get '/index' do
        @cocktails=Cocktail.all
        erb :index
    end
  
    get '/result' do
        exsist=(1..415).to_a 
        @cocktail = Cocktail.find_by(name: params[:name])
        if @cocktail==nil && !logged_in?
            flash[:error] = "There is no such a cocktail under that name in our website, why don't you try to create one?"
            redirect "/login"
        elsif @cocktail!=nil && !logged_in? && !exsist.include?(@cocktail.id)
            flash[:error] = "You don't have access for this cocktail. This cocktail is belong to another user, why don't you try to create one for yourself?"
            redirect "/login"
        elsif @cocktail==nil && logged_in?
            flash[:error] = "There is no such a cocktail under that name in our website, why don't you try to create one?"
            redirect '/cocktails/new'
        else
            redirect "/cocktails/#{@cocktail.id}"
        end
    end

    helpers do
        def current_user
            @current_user ||= User.find_by_id(session["user_id"])
        end

        def logged_in?
            !!current_user
        end

        def redirect_if_not_logged_in
            redirect "/login" if !logged_in?
        end

        def redirect_if_logged_in
            redirect "/cocktails" if logged_in?
        end
    end
end