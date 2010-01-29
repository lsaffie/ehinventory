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

ActiveRecord::Schema.define(:version => 20100123004422) do

  create_table "assignments", :force => true do |t|
    t.integer  "hardware_id", :limit => 11
    t.integer  "software_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size",    :limit => 11
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hardware_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hardwares", :force => true do |t|
    t.string   "serial_number"
    t.string   "ip"
    t.string   "mac"
    t.text     "description"
    t.integer  "owner_id",         :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hardware_type_id", :limit => 11
    t.string   "brand"
    t.string   "model"
  end

  create_table "owners", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.integer  "group_id",   :limit => 11
    t.datetime "updated_at"
  end

  create_table "ports", :force => true do |t|
    t.string   "patch1"
    t.string   "patch2"
    t.string   "patch3"
    t.string   "patch4"
    t.string   "patch5"
    t.string   "patch6"
    t.text     "description"
    t.integer  "room_id",     :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "softwares", :force => true do |t|
    t.string   "name"
    t.string   "owner"
    t.string   "license_key"
    t.string   "number_of_licenses"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "task_name"
    t.boolean  "completed",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "hardware_id", :limit => 11
    t.integer  "software_id", :limit => 11
    t.integer  "document_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
