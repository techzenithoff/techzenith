class CreatePermissionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :permission_items do |t|
      t.string :uid
      t.references :permission, foreign_key: true
      t.string :action_name
      t.string :status

      t.timestamps
    end
  end
end
