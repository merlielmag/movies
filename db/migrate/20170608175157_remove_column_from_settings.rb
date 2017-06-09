class RemoveColumnFromSettings < ActiveRecord::Migration[5.0]
  def change
    remove_column :settings, :country, :string
    remove_column :settings, :language, :string
  end
end
