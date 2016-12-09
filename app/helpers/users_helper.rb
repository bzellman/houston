module UsersHelper

  def isCurrentAdminUser?(user)
    if user
      if user.user_type == 'admin' or user.user_type == 'sherpa'
        true
      else
        false
      end
    end
  end

end
