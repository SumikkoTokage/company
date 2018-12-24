class CreateBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_accounts do |t|
    	t.integer	:bank_code
		t.string	:bank_name
		t.integer	:branch_code_id
		t.integer	:deposit_type_id
		t.integer	:number
		t.string	:name
		t.integer	:creator_id

      t.timestamps
    end
  end
end
