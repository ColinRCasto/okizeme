class CreateGuides < ActiveRecord::Migration[5.2]
  def change
    create_table :guides do |t|
      t.references :user, foreign_key: true
      t.references :character, foreign_key: true
      t.string :link
      t.string :type
      t.integer :votes

      t.timestamps
    end
  end
end
