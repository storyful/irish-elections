class AddSeatsToConstituencies < ActiveRecord::Migration
  def change
    add_column :constituencies, :num_seats, :integer, null: false, default: 0
  end
end
