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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100930135636) do

  create_table "agents", :force => true do |t|
    t.string   "name",                         :null => false
    t.string   "street",                       :null => false
    t.string   "city"
    t.string   "postcode"
    t.string   "district"
    t.string   "state"
    t.string   "country",                      :null => false
    t.string   "telephone",                    :null => false
    t.string   "mobile"
    t.string   "email"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissions", :force => true do |t|
    t.decimal  "from_amount", :precision => 10, :scale => 2
    t.decimal  "to_amount",   :precision => 10, :scale => 2
    t.decimal  "commission",  :precision => 10, :scale => 2
    t.decimal  "charge",      :precision => 10, :scale => 2
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "customer_id",    :null => false
    t.string   "contact_person", :null => false
    t.date     "dob"
    t.string   "sex"
    t.string   "relationship"
    t.string   "street",         :null => false
    t.string   "city",           :null => false
    t.string   "postcode"
    t.string   "district"
    t.string   "state"
    t.string   "country",        :null => false
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "country",    :null => false
    t.string   "full_name",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name",                              :null => false
    t.date     "dob"
    t.string   "sex"
    t.string   "street",                            :null => false
    t.string   "city",                              :null => false
    t.string   "district"
    t.string   "postcode"
    t.string   "country"
    t.string   "position"
    t.string   "ic_number"
    t.string   "passport_number"
    t.string   "telephone",                         :null => false
    t.string   "mobile"
    t.string   "email"
    t.boolean  "active",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exrates", :force => true do |t|
    t.integer  "currency_id",  :null => false
    t.date     "ex_rate_date"
    t.decimal  "buy_rate"
    t.decimal  "sell_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.date     "date",                                             :null => false
    t.time     "time",                                             :null => false
    t.integer  "customer_id",                                      :null => false
    t.string   "receiver_name",                                    :null => false
    t.string   "street",                                           :null => false
    t.string   "city",                                             :null => false
    t.string   "postcode"
    t.string   "district"
    t.string   "state"
    t.string   "country",                                          :null => false
    t.string   "telephone"
    t.string   "mobile_phone"
    t.string   "email"
    t.decimal  "amount",            :precision => 10, :scale => 2, :null => false
    t.decimal  "amount_to_deliver", :precision => 10, :scale => 2, :null => false
    t.string   "delivery_currency",                                :null => false
    t.decimal  "ex_rate",           :precision => 10, :scale => 2, :null => false
    t.string   "delivery_status"
    t.datetime "delivered_on"
    t.integer  "agent_id"
    t.decimal  "commission",        :precision => 10, :scale => 2
    t.decimal  "charge",            :precision => 10, :scale => 0
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "company_name",        :null => false
    t.string   "street",              :null => false
    t.string   "city"
    t.string   "postcode"
    t.string   "country"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.string   "business_license_no"
    t.string   "base_currency",       :null => false
    t.string   "base_currency_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "userlevel"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
