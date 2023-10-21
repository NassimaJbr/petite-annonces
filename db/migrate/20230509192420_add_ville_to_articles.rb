class AddVilleToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :ville, :string
  end
end
