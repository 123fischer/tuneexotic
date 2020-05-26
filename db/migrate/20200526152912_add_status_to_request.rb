class AddStatusToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :status, :string, default: "pending"
  end
end
