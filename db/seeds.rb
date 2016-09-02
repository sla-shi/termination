# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Record.create(
    name: 'John Doe',
    address: '1st Ave.',
    city: 'New York',
    zip: '10200',
    state: 'NY',
    ssn: '124245345239',
    contract_signed_date: '1/09/2010',
    dk_contract_signed_date: false,
    agreement: 'AG-0019',
    dk_agreement_number: false,
    type_of_contract: '24 months',
    dk_type_of_contract: false,
    renewal_date: '1/09/2011',
    dk_renewal_date: false,
    conditional_letter: 'unlimited',
    agree_if_less_than: '100',
    dont_pay_a_dime: false
    )