module TopicsHelper
  def user_is_authorized_for_topics?
       current_user && current_user.moderator? & current_user.admin?
  end

  def user_not_moderator?
       !current_user.moderator?
  end
end
