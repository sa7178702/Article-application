class RemoveColumnFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :name, :string
  end
end
