class AddIntrodactionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introdaction, :string
  end
end
