API.new.get_cocktails_data
CocktailData.all.each do |cocktail|
    cock=Cocktail.create(name: cocktail.strDrink, glass: cocktail.strGlass, ingredient: cocktail.strIngredient.join(", "), instruction: cocktail.strInstructions, image: cocktail.strDrinkThumb)
    cock.save
end