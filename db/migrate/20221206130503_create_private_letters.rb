class CreatePrivateLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :private_letters do |t|
      t.string :text
      t.datetime :date
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
