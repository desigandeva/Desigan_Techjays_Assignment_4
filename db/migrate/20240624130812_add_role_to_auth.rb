class AddRoleToAuth < ActiveRecord::Migration[7.1]
  def change
    add_column :auths, :role, :integer, default: 0
  end
end
