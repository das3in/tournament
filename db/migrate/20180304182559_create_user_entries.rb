class CreateUserEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :user_entries do |t|
      t.references :user, foreign_key: true
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
