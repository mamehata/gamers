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
    {genre_name: '恋愛シミュレーション'},
    {genre_name: 'TRPG'},
  ]
)

members = Member.create!(
  [
    {email: 'a.@test.com', member_name: 'マツ', password: '123456', member_introduction: 'ゲームが趣味です。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member1.jpg"), filename: "sample-member1.jpg")},
    {email: 'b.@test.com', member_name: 'サトウ', password: '098765', member_introduction: '楽しいゲーム探しています。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member2.jpg"), filename: "sample-member2.jpg")},
    {email: 'c.@test.com', member_name: 'カツシ', password: '654321', member_introduction: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member3.jpg"), filename: "sample-member3.jpg")},
    {email: 'd.@test.com', member_name: 'アキト', password: '567890', member_introduction: ''},
    {email: 'e.@test.com', member_name: 'ヤマダ', password: '876543', member_introduction: '難しいゲームを中心に幅広いゲームを楽しんでいます。'},
    {email: 'f.@test.com', member_name: 'ゴトウ', password: '198765', member_introduction: '楽しいゲーム探しています。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member1.jpg"), filename: "sample-member1.jpg")},
    {email: 'g.@test.com', member_name: 'マコト', password: '298765', member_introduction: '楽しいゲーム探しています。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member1.jpg"), filename: "sample-member1.jpg")},
    {email: 'h.@test.com', member_name: 'タナカ', password: '398765', member_introduction: '楽しいゲーム探しています。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member2.jpg"), filename: "sample-member2.jpg")},
    {email: 'i.@test.com', member_name: 'アーノルド', password: '498765', member_introduction: '楽しいゲーム探しています。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member2.jpg"), filename: "sample-member2.jpg")},
    {email: 'j.@test.com', member_name: 'アルファ', password: '598765', member_introduction: '楽しいゲーム探しています。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member3.jpg"), filename: "sample-member3.jpg")},
  ]
)

game_reviews = GameReview.create!(
  [
    {game_title: '楽しいゲーム', game_summary: '楽しいゲームです。', game_impression: 'とても楽しかったです。', game_price: 6000, game_rating: 5, member_id: members.first.id, genre_id: genres[0].id},
    {game_title: '難しいゲーム', game_summary: '難しいゲームです。', game_impression: 'とても難しかったです。', game_price: 5500, game_rating: 4, member_id: members[0].id, genre_id: genres[0].id},
    {game_title: '簡単なゲーム', game_summary: '簡単なゲームです。', game_impression: '少し簡単すぎた', game_price: 4000, game_rating: 2.5, member_id: members[0].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3, member_id: members[0].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 2, member_id: members[0].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[1].id, genre_id: genres[3].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[3].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[3].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[2].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[3].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[2].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[3].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[3].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[3].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[4].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[5].id, genre_id: genres[0].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[5].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[5].id, genre_id: genres[1].id},
    {game_title: 'ゲームのタイトル', game_summary: 'ゲームの概要', game_impression: 'ゲームの感想', game_price: 5000, game_rating: 3.5, member_id: members[5].id, genre_id: genres[1].id},
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
    {game_tag_id: game_tags[7].id, game_review_id: game_reviews[13].id},
    {game_tag_id: game_tags[4].id, game_review_id: game_reviews[12].id},
    {game_tag_id: game_tags[3].id, game_review_id: game_reviews[13].id},
    {game_tag_id: game_tags[4].id, game_review_id: game_reviews[14].id},
    {game_tag_id: game_tags[5].id, game_review_id: game_reviews[15].id},
    {game_tag_id: game_tags[7].id, game_review_id: game_reviews[12].id}
  ]
)

goods_reviews = GoodsReview.create!(
  [
    {goods_name: 'ゲームミングPC', goods_summary: 'ゲームミングPCです。', goods_impression: 'とても見やすかったです。', goods_price: 6000, goods_rating: 5, member_id: members.first.id},
    {goods_name: 'コントロール', goods_summary: 'コントロールです。', goods_impression: 'とても扱いやすかったです。', goods_price: 5500, goods_rating: 4, member_id: members[0].id},
    {goods_name: 'ワイヤレスマウス', goods_summary: 'ワイヤレスマウスです。', goods_impression: '少し反応が悪かったです。', goods_price: 4000, goods_rating: 2.5, member_id: members[0].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3, member_id: members[0].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 2, member_id: members[0].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[1].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[1].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[1].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[1].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[1].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[2].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[2].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[2].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[2].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[2].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[3].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[3].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[3].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[3].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[3].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[4].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[4].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[4].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[4].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[4].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[5].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[5].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[5].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[5].id},
    {goods_name: 'グッズ名', goods_summary: 'グッズの概要', goods_impression: 'グッズの感想', goods_price: 5000, goods_rating: 3.5, member_id: members[5].id}
  ]
)

goods_tags = GoodsTag.create!(
  [
    {goods_tag_name: '安い'},
    {goods_tag_name: '持ち運べる'},
    {goods_tag_name: '上級者向け'},
    {goods_tag_name: '初心者向け'},
    {goods_tag_name: '軽い'},
    {goods_tag_name: '頑丈'},
    {goods_tag_name: 'コンパクト'},
    {goods_tag_name: '本気'}
  ]
)

GoodsReviewTag.create!(
  [
    {goods_tag_id: goods_tags[0].id, goods_review_id: goods_reviews[0].id},
    {goods_tag_id: goods_tags[1].id, goods_review_id: goods_reviews[1].id},
    {goods_tag_id: goods_tags[2].id, goods_review_id: goods_reviews[2].id},
    {goods_tag_id: goods_tags[3].id, goods_review_id: goods_reviews[3].id},
    {goods_tag_id: goods_tags[4].id, goods_review_id: goods_reviews[4].id},
    {goods_tag_id: goods_tags[5].id, goods_review_id: goods_reviews[5].id},
    {goods_tag_id: goods_tags[6].id, goods_review_id: goods_reviews[6].id},
    {goods_tag_id: goods_tags[7].id, goods_review_id: goods_reviews[7].id},
    {goods_tag_id: goods_tags[7].id, goods_review_id: goods_reviews[8].id},
    {goods_tag_id: goods_tags[6].id, goods_review_id: goods_reviews[9].id},
    {goods_tag_id: goods_tags[5].id, goods_review_id: goods_reviews[16].id},
    {goods_tag_id: goods_tags[4].id, goods_review_id: goods_reviews[11].id},
    {goods_tag_id: goods_tags[3].id, goods_review_id: goods_reviews[12].id},
    {goods_tag_id: goods_tags[7].id, goods_review_id: goods_reviews[13].id},
    {goods_tag_id: goods_tags[4].id, goods_review_id: goods_reviews[12].id},
    {goods_tag_id: goods_tags[3].id, goods_review_id: goods_reviews[13].id},
    {goods_tag_id: goods_tags[4].id, goods_review_id: goods_reviews[14].id},
    {goods_tag_id: goods_tags[5].id, goods_review_id: goods_reviews[15].id},
    {goods_tag_id: goods_tags[7].id, goods_review_id: goods_reviews[12].id}
  ]
)

groups = Group.create!(
  [
    {group_name: "ゲームを楽しみ隊", group_introduction: "一緒にゲームを楽しみませんか？", game_review_id: game_reviews[3].id, group_owner_id: members[0].id},
    {group_name: "ゲームについて語らい隊", group_introduction: "ゲームについて語らいましょう", game_review_id: game_reviews[9].id, group_owner_id: members[1].id},
    {group_name: "グループネーム", group_introduction: "", game_review_id: game_reviews[11].id, group_owner_id: members[2].id},
    {group_name: "グループネーム", group_introduction: "", game_review_id: game_reviews[17].id, group_owner_id: members[3].id},
    {group_name: "グループネーム", group_introduction: "", game_review_id: game_reviews[23].id, group_owner_id: members[4].id},
    {group_name: "グループネーム", group_introduction: "グループ紹介文", game_review_id: game_reviews[26].id, group_owner_id: members[5].id},
    {group_name: "グループネーム", group_introduction: "グループ紹介文", game_review_id: game_reviews[1].id, group_owner_id: members[0].id},
    {group_name: "グループネーム", group_introduction: "グループ紹介文", game_review_id: game_reviews[7].id, group_owner_id: members[1].id},
    {group_name: "グループネーム", group_introduction: "グループ紹介文", game_review_id: game_reviews[14].id, group_owner_id: members[2].id},
    {group_name: "グループネーム", group_introduction: "グループ紹介文", game_review_id: game_reviews[19].id, group_owner_id: members[3].id},
    {group_name: "グループネーム", group_introduction: "グループ紹介文", game_review_id: game_reviews[24].id, group_owner_id: members[4].id},
    {group_name: "グループネーム", group_introduction: "グループ紹介文", game_review_id: game_reviews[27].id, group_owner_id: members[5].id},
    {group_name: "グループネーム", group_introduction: "", game_review_id: game_reviews[29].id, group_owner_id: members[5].id},
    {group_name: "グループネーム", group_introduction: "", game_review_id: game_reviews[21].id, group_owner_id: members[4].id},
    {group_name: "グループネーム", group_introduction: "", game_review_id: game_reviews[16].id, group_owner_id: members[3].id},
  ]
)

group_rooms = GroupRoom.create!(
  [
    {room_name: "ルーム１", group_id: groups[0].id, room_owner_id: members[0].id},
    {room_name: "ルーム１", group_id: groups[1].id, room_owner_id: members[1].id},
    {room_name: "ルーム２", group_id: groups[1].id, room_owner_id: members[4].id},
    {room_name: "ルーム１", group_id: groups[2].id, room_owner_id: members[2].id},
    {room_name: "ルーム２", group_id: groups[2].id, room_owner_id: members[5].id},
    {room_name: "ルーム１", group_id: groups[3].id, room_owner_id: members[3].id},
    {room_name: "ルーム１", group_id: groups[4].id, room_owner_id: members[4].id},
    {room_name: "ルーム１", group_id: groups[5].id, room_owner_id: members[8].id},
    {room_name: "ルーム１", group_id: groups[6].id, room_owner_id: members[6].id},
    {room_name: "ルーム１", group_id: groups[7].id, room_owner_id: members[7].id},
    {room_name: "ルーム２", group_id: groups[7].id, room_owner_id: members[9].id},
  ]
)

group_members = GroupMember.create!(
  [
    {group_id: groups[0].id, member_id: members[0].id, group_room_id: group_rooms[0].id},
    {group_id: groups[0].id, member_id: members[2].id, group_room_id: nil},
    {group_id: groups[1].id, member_id: members[1].id, group_room_id: group_rooms[1].id},
    {group_id: groups[1].id, member_id: members[4].id, group_room_id: group_rooms[2].id},
    {group_id: groups[1].id, member_id: members[6].id, group_room_id: nil},
    {group_id: groups[2].id, member_id: members[2].id, group_room_id: group_rooms[3].id},
    {group_id: groups[2].id, member_id: members[5].id, group_room_id: group_rooms[4].id},
    {group_id: groups[3].id, member_id: members[3].id, group_room_id: group_rooms[5].id},
    {group_id: groups[3].id, member_id: members[9].id, group_room_id: nil},
    {group_id: groups[3].id, member_id: members[2].id, group_room_id: group_rooms[5].id},
    {group_id: groups[3].id, member_id: members[0].id, group_room_id: nil},
    {group_id: groups[4].id, member_id: members[4].id, group_room_id: group_rooms[6].id},
    {group_id: groups[5].id, member_id: members[5].id, group_room_id: nil},
    {group_id: groups[5].id, member_id: members[8].id, group_room_id: group_rooms[7].id},
    {group_id: groups[6].id, member_id: members[0].id, group_room_id: group_rooms[8].id},
    {group_id: groups[7].id, member_id: members[1].id, group_room_id: group_rooms[9].id},
    {group_id: groups[7].id, member_id: members[9].id, group_room_id: group_rooms[10].id},
    {group_id: groups[8].id, member_id: members[2].id, group_room_id: nil},
    {group_id: groups[9].id, member_id: members[3].id, group_room_id: nil},
    {group_id: groups[10].id, member_id: members[4].id, group_room_id: nil},
    {group_id: groups[11].id, member_id: members[5].id, group_room_id: nil},
    {group_id: groups[12].id, member_id: members[5].id, group_room_id: nil},
    {group_id: groups[13].id, member_id: members[4].id, group_room_id: nil},
    {group_id: groups[14].id, member_id: members[3].id, group_room_id: nil},
  ]
)