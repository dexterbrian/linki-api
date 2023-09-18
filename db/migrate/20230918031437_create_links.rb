class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
