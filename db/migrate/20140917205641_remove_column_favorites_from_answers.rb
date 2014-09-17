class RemoveColumnFavoritesFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :favorite, :boolean
  end
end
