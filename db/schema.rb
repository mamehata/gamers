# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_14_065155) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_follows_on_followed_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "game_comments", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "game_review_id", null: false
    t.text "game_comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_review_id"], name: "index_game_comments_on_game_review_id"
    t.index ["member_id"], name: "index_game_comments_on_member_id"
  end

  create_table "game_likes", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "game_review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_review_id"], name: "index_game_likes_on_game_review_id"
    t.index ["member_id"], name: "index_game_likes_on_member_id"
  end

  create_table "game_review_tags", force: :cascade do |t|
    t.integer "game_tag_id", null: false
    t.integer "game_review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_review_id"], name: "index_game_review_tags_on_game_review_id"
    t.index ["game_tag_id"], name: "index_game_review_tags_on_game_tag_id"
  end

  create_table "game_reviews", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "genre_id", null: false
    t.string "game_title", null: false
    t.text "game_summary", null: false
    t.text "game_impression", null: false
    t.integer "game_price", null: false
    t.float "game_rating", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_game_reviews_on_genre_id"
    t.index ["member_id"], name: "index_game_reviews_on_member_id"
  end

  create_table "game_tags", force: :cascade do |t|
    t.string "game_tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goods_comments", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "goods_review_id", null: false
    t.text "goods_comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goods_review_id"], name: "index_goods_comments_on_goods_review_id"
    t.index ["member_id"], name: "index_goods_comments_on_member_id"
  end

  create_table "goods_likes", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "goods_review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goods_review_id"], name: "index_goods_likes_on_goods_review_id"
    t.index ["member_id"], name: "index_goods_likes_on_member_id"
  end

  create_table "goods_review_tags", force: :cascade do |t|
    t.integer "goods_tag_id", null: false
    t.integer "goods_review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goods_review_id"], name: "index_goods_review_tags_on_goods_review_id"
    t.index ["goods_tag_id"], name: "index_goods_review_tags_on_goods_tag_id"
  end

  create_table "goods_reviews", force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "goods_name", null: false
    t.text "goods_summary", null: false
    t.text "goods_impression", null: false
    t.integer "goods_price", null: false
    t.float "goods_rating", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_goods_reviews_on_member_id"
  end

  create_table "goods_tags", force: :cascade do |t|
    t.string "goods_tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_chats", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "group_id", null: false
    t.text "group_chat", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_chats_on_group_id"
    t.index ["member_id"], name: "index_group_chats_on_member_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "group_id", null: false
    t.integer "group_room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["group_room_id"], name: "index_group_members_on_group_room_id"
    t.index ["member_id"], name: "index_group_members_on_member_id"
  end

  create_table "group_rooms", force: :cascade do |t|
    t.integer "room_owner_id", null: false
    t.integer "group_id", null: false
    t.string "room_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_rooms_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "game_review_id", null: false
    t.integer "group_owner_id", null: false
    t.string "group_name", null: false
    t.text "group_introduction", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_review_id"], name: "index_groups_on_game_review_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "member_name", null: false
    t.string "member_introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "room_chats", force: :cascade do |t|
    t.integer "group_room_id", null: false
    t.integer "group_member_id", null: false
    t.text "room_chat", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_member_id"], name: "index_room_chats_on_group_member_id"
    t.index ["group_room_id"], name: "index_room_chats_on_group_room_id"
  end

  create_table "room_members", force: :cascade do |t|
    t.integer "group_member_id", null: false
    t.integer "group_room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_member_id"], name: "index_room_members_on_group_member_id"
    t.index ["group_room_id"], name: "index_room_members_on_group_room_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "follows", "followeds"
  add_foreign_key "follows", "followers"
  add_foreign_key "game_comments", "game_reviews"
  add_foreign_key "game_comments", "members"
  add_foreign_key "game_likes", "game_reviews"
  add_foreign_key "game_likes", "members"
  add_foreign_key "game_review_tags", "game_reviews"
  add_foreign_key "game_review_tags", "game_tags"
  add_foreign_key "game_reviews", "genres"
  add_foreign_key "game_reviews", "members"
  add_foreign_key "goods_comments", "goods_reviews"
  add_foreign_key "goods_comments", "members"
  add_foreign_key "goods_likes", "goods_reviews"
  add_foreign_key "goods_likes", "members"
  add_foreign_key "goods_review_tags", "goods_reviews"
  add_foreign_key "goods_review_tags", "goods_tags"
  add_foreign_key "goods_reviews", "members"
  add_foreign_key "group_chats", "groups"
  add_foreign_key "group_chats", "members"
  add_foreign_key "group_members", "group_rooms"
  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "members"
  add_foreign_key "group_rooms", "groups"
  add_foreign_key "groups", "game_reviews"
  add_foreign_key "room_chats", "group_members"
  add_foreign_key "room_chats", "group_rooms"
  add_foreign_key "room_members", "group_members"
  add_foreign_key "room_members", "group_rooms"
end
