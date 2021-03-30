class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :glass
      t.string :ingredient
      t.string :instruction
      t.string :image
    end
  end
end
