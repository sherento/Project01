class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :profile
      t.text :image
      t.timestamps
    end
  end
end
