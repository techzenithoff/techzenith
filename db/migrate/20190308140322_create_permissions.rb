class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.string :uid
      t.references :feature, foreign_key: true
      t.references :role, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
