class ChangeDataTypeUserId < ActiveRecord::Migration
  def change
    remove_column :answers, :user_id

    add_column :answers, :user_id, :integer
  end
end
