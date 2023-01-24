# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: ENV["ADMIN_EMAIL"], password: ENV["ADMIN_PASSWORD"]
)

genres = Genre.create!(
  [
    {genre_name: 'アクション'},
    {genre_name: 'FPS'},
    {genre_name: 'TRPG'}
  ]
)

members = Member.create!(
  [
    {email: 'a.@test.com', member_name: 'マツ', password: '123456', member_introduction: 'ゲームが趣味です。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member1.jpg"), filename: "sample-member1.jpg")},
    {email: 'b.@test.com', member_name: 'サトウ', password: '098765', member_introduction: '楽しいゲーム探しています。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member2.jpg"), filename: "sample-member2.jpg")},
    {email: 'c.@test.com', member_name: 'カツシ', password: '654321', member_introduction: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member3.jpg"), filename: "sample-member3.jpg")},
    {email: 'd.@test.com', member_name: 'アキト', password: '567890', member_introduction: ''},
    {email: 'e.@test.com', member_name: 'ヤマダ', password: '876543', member_introduction: '難しいゲームを中心に幅広いゲームを楽しんでいます。'}
  ]
)


game_reviews = GameReview.create!(
  [
    {game_title: '楽しいゲーム', game_summary: '楽しいゲームです。', game_impression: 'とても楽しかったです。', game_price: 6000, game_rating: 5, member_id: members.first.id, genre_id: genres[0].id},
    {game_title: '難しいゲーム', game_summary: '難しいゲームです。', game_impression: 'とても難しかったです。', game_price: 5500, game_rating: 4, member_id: members[0].id, genre_id: genres[0].id},
    {game_title: '簡単なゲーム', game_summary: '簡単なゲームです。', game_impression: '少し簡単すぎた', game_price: 4000, game_rating: 2.5, member_id: members[0].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[0].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[0].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[2].id}
  ]
)

game_tags = GameTag.create!(
  [
    {game_tag_name: '高難度'},
    {game_tag_name: '簡単'},
    {game_tag_name: '上級者向け'},
    {game_tag_name: '初心者向け'},
    {game_tag_name: '2D'},
    {game_tag_name: '3D'},
    {game_tag_name: 'キャラゲー'},
    {game_tag_name: '多人数'}
  ]
)

GameReviewTag.create!(
  [
    {game_tag_id: game_tags[0].id, game_review_id: game_reviews[0].id},
    {game_tag_id: game_tags[1].id, game_review_id: game_reviews[1].id},
    {game_tag_id: game_tags[2].id, game_review_id: game_reviews[2].id},
    {game_tag_id: game_tags[3].id, game_review_id: game_reviews[3].id},
    {game_tag_id: game_tags[4].id, game_review_id: game_reviews[4].id},
    {game_tag_id: game_tags[5].id, game_review_id: game_reviews[5].id},
    {game_tag_id: game_tags[6].id, game_review_id: game_reviews[6].id},
    {game_tag_id: game_tags[7].id, game_review_id: game_reviews[7].id},
    {game_tag_id: game_tags[7].id, game_review_id: game_reviews[8].id},
    {game_tag_id: game_tags[6].id, game_review_id: game_reviews[9].id},
    {game_tag_id: game_tags[5].id, game_review_id: game_reviews[10].id},
    {game_tag_id: game_tags[4].id, game_review_id: game_reviews[11].id},
    {game_tag_id: game_tags[3].id, game_review_id: game_reviews[12].id},
    {game_tag_id: game_tags[7].id, game_review_id: game_reviews[13].id}
  ]
)