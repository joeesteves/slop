class AddUltEmpUltEstToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :ult_emp, :integer
		add_column :users, :ult_est, :integer
	end
end
