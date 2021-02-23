class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |r|
      r.string :title
      r.text :description
      r.text :ingredients
      r.text :directions
      r.timestamps
    end
  end
end
