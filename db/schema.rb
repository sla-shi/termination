# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160823093225) do

  create_table "records", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.string   "ssn"
    t.date     "contract_signed_date"
    t.boolean  "dk_contract_signed_date"
    t.string   "agreement"
    t.boolean  "dk_agreement_number"
    t.string   "type_of_contract"
    t.boolean  "dk_type_of_contract"
    t.date     "renewal_date"
    t.boolean  "dk_renewal_date"
    t.string   "conditional_letter"
    t.string   "agree_if_less_than"
    t.boolean  "dont_pay_a_dime"
    t.string   "reserved1"
    t.integer  "reserved2"
    t.boolean  "reserved3"
    t.date     "reserved4"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
