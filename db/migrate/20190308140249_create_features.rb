class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :uid
      t.string :name
      t.string :subject_class
      t.text :description
      t.string :status
      
      t.timestamps
    end
  end
end
