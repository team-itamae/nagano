class ChangeGenreIdToItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :genre_id, :integer, null: false
  end
end
