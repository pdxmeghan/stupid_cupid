class AddColumnToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :question_id, :integer
  end
end
