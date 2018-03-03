class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :home_score, default: 0
      t.integer :away_score, default: 0
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
