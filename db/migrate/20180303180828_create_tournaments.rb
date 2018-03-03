class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.references :division, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
