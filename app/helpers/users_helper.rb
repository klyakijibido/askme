module UsersHelper
  def nickname_with_dog(user)
    "@#{user.nickname}"
  end
end
