class CreateLearns < ActiveRecord::Migration[6.1]
  def change
    create_table :learns do |t|
      t.string :date
      t.string :content
      t.string :note
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
