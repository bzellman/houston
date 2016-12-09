class UsersController < Clearance::BaseController

  # before_action :require_login
  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: [:create, :new]
    skip_before_action :require_login, only: [:create, :new], raise: false
    skip_before_action :authorize, only: [:create, :new], raise: false
  else
    before_filter :redirect_signed_in_users, only: [:create, :new]
    skip_before_filter :require_login, only: [:create, :new], raise: false
    skip_before_filter :authorize, only: [:create, :new], raise: false
  end

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params

    if current_user.user_type != 'admin'
      if @user.save
        sign_in @user
        redirect_back_or url_after_create
      else
        render template: "users/new"
      end
    else
      if @user.save
        new
        puts "New User Saved"
        @user = nil
      else
        render template: "users/new"
      end

    end

  end

  private

  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
             "deprecated. Use `redirect_signed_in_users` instead. " +
             "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
             " or `skip_before_action :avoid_sign_in` as well"
    redirect_signed_in_users
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end



  def show
    @user = User.find(params[:id])
  end


  def index
    @users = User.all
  end



  private

  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
             "deprecated. Use `redirect_signed_in_users` instead. " +
             "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
             " or `skip_before_action :avoid_sign_in` as well"
    redirect_signed_in_users
  end

  def redirect_signed_in_users
    if signed_in? && current_user.user_type != 'admin'
      puts 'Not Admin'
      redirect_to Clearance.configuration.redirect_url
    else
      puts 'Admin'
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    user_type = user_params.delete(:user_type)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.user_type = user_type
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

end
