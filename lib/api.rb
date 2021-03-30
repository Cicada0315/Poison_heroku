# require 'httparty'
# require 'pry'
# require_relative 'cocktail_data.rb'
class API  
    def initialize
      @base_endpoint= "https://www.thecocktaildb.com/api/json/v1/1/search.php?f="
    end
      
    def get_cocktails_data
      char=[*('a'..'z')]
      char.delete('u')
      char.delete('x')
      char.each do |alphabet|
        cocktail_url=@base_endpoint+alphabet
        cocktails_array=HTTParty.get(cocktail_url)["drinks"]
        self.create_cocktail_objects(cocktails_array)
      end
    end
  
    def create_cocktail_objects(cocktails_array)
        cocktails_array.each do |cocktail_hash|
        cocktail=CocktailData.new(cocktail_hash)
      end
    end
end
  
#API.new.get_cocktails_data