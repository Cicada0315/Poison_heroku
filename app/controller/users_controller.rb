class UsersController < ApplicationController
    get '/signup' do
        redirect_if_logged_in
        erb :"users/new"
    end

    post '/signup' do
        redirect_if_logged_in
        if params[:user][:birthday] > 21.years.ago
            flash[:error] = "Sorry, you must be over 21 years old in order to register. Come back when you are turn to 21!"
            redirect "/signup"
        elsif User.find_by(email: params[:user][:email])
            flash[:error] = "Email you entered already exsist!"
            redirect "/signup"
        else
            user = User.new(params[:user])
        
            if user.save
                session["user_id"] = user.id
                flash[:error]="Welcome to Poison, #{user.name}"
                redirect "/cocktails"
            else
                redirect "/signup"
            end
        end
    end
end