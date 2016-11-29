module UsersHelper

  def isCurrentAdminUser?(user)
    if user
      if user.user_type == 'admin'
        true
      else
        false
      end
    end
  end

end
