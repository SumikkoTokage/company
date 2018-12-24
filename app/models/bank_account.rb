class BankAccount < ApplicationRecord
	belongs_to :creator, inverse_of: :bank_accounts

	enum deposit_type_id: {
      普通預金: 0,
      当座預金: 1
  	}
end
