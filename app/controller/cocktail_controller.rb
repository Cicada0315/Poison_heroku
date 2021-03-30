class CocktailController < ApplicationController
    get '/cocktails' do
        redirect_if_not_logged_in
        @cocktails = current_user.cocktails
        erb :'cocktails/index'
    end

    get '/cocktails/new' do
        redirect_if_not_logged_in
        erb :'cocktails/new'
    end

    get '/cocktails/:id' do
        redirect_if_not_authorized
        @cocktail=Cocktail.find(params[:id])
        erb :'cocktails/show'
    end

    post '/cocktails' do
        redirect_if_not_logged_in
        cocktail = current_user.cocktails.build(params[:cocktail])

        if cocktail.save
            redirect "/cocktails/#{cocktail.id}"
        else
            flash[:error] = "#{cocktail.errors.full_messages.join(", ")}"
            redirect "/cocktails/new"
        end
    end
    
    get '/cocktails/:id/edit' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        erb :'cocktails/edit'
    end

    patch '/cocktails/:id' do
        redirect_if_not_authorized
        if @cocktail.update(params["cocktail"])
            redirect "/cocktails/#{@cocktail.id}"
        else
            redirect "/cocktails/#{@cocktail.id}/edit"
        end
    end

    delete "/cocktails/:id" do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        @cocktail.destroy
        redirect "/cocktails"
    end

    private
    def redirect_if_not_authorized
        @cocktail = Cocktail.find_by_id(params[:id])
        exsist=(1..415).to_a 
        if params[:id].to_i > Cocktail.last.id || !exsist.include?(@cocktail.id) && @cocktail.user_id != session["user_id"] 
            flash[:error] = "You can only view your cocktails."
            redirect "/cocktails"
        end
    end 
end