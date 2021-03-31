class CreateHeaders < ActiveRecord::Migration[6.1]
  def change
    create_table :headers do |t|
      t.timestamps
      t.references :member, foreign_key: true
      t.string :text
    end
  end
end
