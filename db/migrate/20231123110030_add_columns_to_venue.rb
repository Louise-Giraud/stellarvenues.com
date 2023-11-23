class AddColumnsToVenue < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :logistic_partner, :string
    add_column :venues, :access, :string
    add_column :venues, :available_ressrouces, :string
  end
end
