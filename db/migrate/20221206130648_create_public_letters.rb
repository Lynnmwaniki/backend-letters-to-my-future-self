class CreatePublicLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :public_letters do |t|
      t.string :text
      t.datetime :date
      t.integer :views
      t.integer :likes
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
