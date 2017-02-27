User.create!(email: 'admin@admin.com',password: 'adminadmin')
user = User.first
Task.create!(
  name: "Hello world",
  complete: true,
  user_id: user.id
)
Task.create!(
  name: "do new app",
  complete: true,
  user_id: user.id
)
Task.create!(
  name: "Drink coffe",
  complete: false,
  user_id: user.id
)
Task.create!(
  name: "Log in to get your own ToDoList:)",
  complete: false,
  user_id: user.id
)
