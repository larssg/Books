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

ActiveRecord::Schema.define(:version => 20080627214858) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorships", :force => true do |t|
    t.integer  "book_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "name"
    t.string   "isbn"
    t.integer  "pages"
    t.date     "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "amazon_detail_page_url"
    t.string   "small_image_url"
    t.string   "medium_image_url"
    t.string   "large_image_url"
  end

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", :force => true do |t|
    t.integer  "publisher_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
