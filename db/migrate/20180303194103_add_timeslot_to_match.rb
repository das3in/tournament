class AddTimeslotToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :timeslot, foreign_key: true, index: true
  end
end
