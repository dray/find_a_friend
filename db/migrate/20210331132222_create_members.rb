class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.timestamps
      t.string :first_name
      t.string :last_name
      t.string :original_url
      t.string :short_url
    end
  end
end
