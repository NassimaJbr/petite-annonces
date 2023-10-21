class AddPrixToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :prix_min, :decimal
    add_column :articles, :prix_max, :decimal
  end
end
