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

ActiveRecord::Schema.define(version: 20170831035105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "code_generators", force: :cascade do |t|
    t.text "image_data"
    t.string "website_url"
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "job_title"
    t.string "street"
    t.string "city"
    t.string "pin_code"
    t.string "country"
    t.string "state"
    t.string "mobile"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "others"
    t.string "subject"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
