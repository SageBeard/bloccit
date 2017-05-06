module UsersHelper
  def user_post?(post)
    user.post.count(0)
    "{user.name} has not submitted any posts yet."
  end
  def user_comment?(comment)
    user.comment.count(0)
    "{user.name} has not submitted any comments yet."
  end
end
