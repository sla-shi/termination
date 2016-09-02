class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :zip
      t.string :state
      t.string :ssn
      t.date :contract_signed_date
      t.boolean :dk_contract_signed_date
      t.string :agreement
      t.boolean :dk_agreement_number
      t.string :type_of_contract
      t.boolean :dk_type_of_contract
      t.date :renewal_date
      t.boolean :dk_renewal_date
      t.string :conditional_letter
      t.string :agree_if_less_than
      t.boolean :dont_pay_a_dime
      t.string :reserved1
      t.integer :reserved2
      t.boolean :reserved3
      t.date :reserved4

      t.timestamps null: false
    end
  end
end
