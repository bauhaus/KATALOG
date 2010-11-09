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

ActiveRecord::Schema.define(:version => 20101103151730) do

  create_table "credits", :force => true do |t|
    t.integer  "person_id"
    t.integer  "thing_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tools"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website_url"
    t.integer  "user_id"
  end

  create_table "images", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
  end

  create_table "kontext_links", :force => true do |t|
    t.integer  "kontext_id"
    t.integer  "kontextable_id"
    t.string   "kontextable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kontexts", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lft"
    t.integer  "rgt"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "motto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "institution",     :default => false
    t.integer  "department_id"
    t.integer  "study_module_id"
  end

  create_table "people_study_modules", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "study_module_id"
  end

  create_table "study_modules", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "kind"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "study_modules_things", :id => false, :force => true do |t|
    t.integer "thing_id"
    t.integer "study_module_id"
  end

  create_table "thing_list_items", :force => true do |t|
    t.integer  "thing_id"
    t.integer  "thing_list_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thing_lists", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "things", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "license"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "kind"
    t.string   "materials"
    t.integer  "dimensions_x"
    t.integer  "dimensions_y"
    t.integer  "dimensions_z"
    t.string   "dimensions_unit"
    t.string   "dimensions_additional"
    t.datetime "release_date"
    t.datetime "start_date"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",        :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",        :null => false
    t.string   "password_salt",                       :default => "",        :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                               :default => false,     :null => false
    t.string   "role",                                :default => "student"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
