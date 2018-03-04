class AddRecrutingToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :recruiting, :boolean, default: false
  end
end
