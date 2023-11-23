class UpdateAvailableRessourceToVenue < ActiveRecord::Migration[7.1]
  def change
    remove_column :venues, :available_ressrouces, :string
    add_column :venues, :available_ressources, :string
  end
end
