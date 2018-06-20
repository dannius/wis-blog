class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.belongs_to :user, index: true
      t.string :title, null: false

      t.timestamps
    end

    add_index :categories, [:title, :user_id], unique: true
  end
end
