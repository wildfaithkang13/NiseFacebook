10.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
               name: (0...8).map{ ('A'..'Z').to_a[rand(26)] }.join,
               uid: (0...8).map{ ('A'..'Z').to_a[rand(26)] }.join,
               password: password,
               password_confirmation: password
               )
end

#facebookテーブルのテストレコードを10件生成する
n = 1
while n <= 10
  Facebook.create(
    title: "あああ",
    content: "hoge",
    user_id: n,
  )
  n = n + 1
end

#コメントテーブルのテストレコードを10件生成する
n = 1
while n <= 10
  Comment.create(
    user_id: n,
    facebook_id: n,
    content: "hoge",
  )
  n = n + 1
end
