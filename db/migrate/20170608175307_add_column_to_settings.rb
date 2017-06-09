class AddColumnToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :country, :string, default: 'Country'
    add_column :settings, :language, :string, default: 'Language'
  end
end
