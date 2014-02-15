class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_dgest, :string
  end
end
