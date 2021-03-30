class CocktailData
    attr_accessor :strIngredient
    @@all=[]
    def initialize(cocktail_hash)
        ingredient_with_measure=[]
        ingredient_value=[]
        measure_value=[]
        cocktail_hash.each do  |key, value|
            #ingredient and measure was in separte key but I just combine them as one string
            ingredient=["strIngredient1", "strIngredient2", "strIngredient3","strIngredient4","strIngredient5","strIngredient6","strIngredient7","strIngredient8","strIngredient9","strIngredient10","strIngredient11","strIngredient12","strIngredient13","strIngredient14","strIngredient15"]
            measure=["strMeasure1", "strMeasure2", "strMeasure3","strMeasure4","strMeasure5","strMeasure6","strMeasure7","strMeasure8","strMeasure9","strMeasure10","strMeasure11","strMeasure12","strMeasure13","strMeasure14","strMeasure15"]
            if key=="strDrink" || key=="strGlass" ||key=="strInstructions" ||key=="strDrinkThumb"
                self.class.attr_accessor(key)
                self.send("#{key}=", value)
            elsif ingredient.include?(key)
                ingredient_value << value
            elsif measure.include?(key)
                measure_value << value
            end
        end
        ingredient_value.each_with_index do |value, index|
            if value!=nil
                ingredient_with_measure << "#{value} = #{measure_value[index]}"
            end
        end
        @strIngredient=ingredient_with_measure
        @@all << self
    end
  
    def self.all
      @@all
    end 
end
