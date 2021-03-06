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

ActiveRecord::Schema.define(:version => 20130808095750) do

  create_table "emails", :force => true do |t|
    t.integer  "user_id"
    t.string   "from_name"
    t.string   "from_email"
    t.string   "to_email"
    t.string   "subject"
    t.text     "html_body"
    t.text     "text_body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
  end

  add_index "emails", ["user_id"], :name => "index_emails_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "login_count"
    t.datetime "last_logged_in_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
