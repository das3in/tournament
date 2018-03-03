class AddEntriesToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :home_team, index: true, foreign_key: { to_table: :entries }
    add_reference :matches, :away_team, index: true, foreign_key: { to_table: :entries }
  end
end
