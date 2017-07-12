class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
    	t.string :name
    	t.references :user
      t.timestamps
    end
  end
end
