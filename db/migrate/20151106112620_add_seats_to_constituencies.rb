class AddSeatsToConstituencies < ActiveRecord::Migration
  def change
    add_column :constituencies, :num_seats, :integer, null: false
  end
end
