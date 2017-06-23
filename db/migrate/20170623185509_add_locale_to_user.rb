class AddLocaleToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :locale, :string, default:'es'
  end
end
