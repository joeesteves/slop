class AddColumnCreditDebitCuotas < ActiveRecord::Migration
  def change
  	  add_column :cuotas, :tipo, :integer 
			add_index :cuotas, :tipo 
  end
end
