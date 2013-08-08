class ChangePasswordRelatedColumnsOnUsers < ActiveRecord::Migration
  def up
    rename_column :users, :password_hash, :password_digest
    remove_column :users, :password_salt
  end

  def down
    rename_column :users, :password_digest, :password_hash
    add_column :users, :password_salt, :string
  end
end
