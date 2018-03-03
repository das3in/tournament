class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false, default: ""
      t.references :captain, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
