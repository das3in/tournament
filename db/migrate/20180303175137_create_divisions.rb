class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :divisions do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end
