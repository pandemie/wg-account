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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130629131513) do

  create_table "credits", :force => true do |t|
    t.integer  "transaction_id"
    t.integer  "flatmate_group_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "debts", :force => true do |t|
    t.integer  "transaction_id"
    t.integer  "flatmate_group_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "flatmate_group_memberships", :force => true do |t|
    t.integer  "flatmate_id"
    t.integer  "flatmate_group_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

# Could not dump table "flatmate_groups" because of following StandardError
#   Unknown type 'bool' for column 'is_active'

  create_table "flatmates", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.decimal  "amount",      :precision => 8, :scale => 2
    t.string   "description"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

end
