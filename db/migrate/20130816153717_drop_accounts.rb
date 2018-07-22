class DropAccounts < ActiveRecord::Migration
 def up
			drop_table :accounts
  end

  def down
  end
end
