# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100724112633) do

  create_table "addresses", :force => true do |t|
    t.integer  "customer_id",    :null => false
    t.string   "contact_person", :null => false
    t.date     "dob"
    t.string   "sex"
    t.string   "relationship"
    t.string   "address",        :null => false
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

  create_table "agents", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "address",    :null => false
    t.string   "city"
    t.string   "postcode"
    t.string   "district"
    t.string   "state"
    t.string   "country",    :null => false
    t.string   "telephone",  :null => false
    t.string   "mobile"
    t.string   "email"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name",            :null => false
    t.date     "dob"
    t.string   "sex"
    t.string   "address",         :null => false
    t.string   "city",            :null => false
    t.string   "district"
    t.string   "postcode"
    t.string   "country"
    t.string   "ic_number"
    t.string   "passport_number"
    t.string   "telephone",       :null => false
    t.string   "mobile"
    t.string   "email"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
