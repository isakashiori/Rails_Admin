User.create!(
    email: "admin@example.com",
    password: "password",
    password_confirmation: "password",
    first_name: "isaka",
    last_name: "shiori",
    avatar: "管理者",
    role: 1
)
User.create!(
    email: "user@example.com",
    password: "password1",
    password_confirmation: "password1",
    first_name: "user",
    last_name: "user",
    avatar: "ユーザー",
    role: 0
)