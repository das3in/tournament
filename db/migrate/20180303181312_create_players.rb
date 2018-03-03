class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""

      t.timestamps
    end
  end
end
