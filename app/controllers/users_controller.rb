class UsersController < Clearance::BaseController

  before_action :require_login

  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: []
    skip_before_action :require_login, only: [:create, :new], raise: false
    skip_before_action :authorize, only: [:create, :new], raise: false
  else
    before_filter :redirect_signed_in_users, only: [:create, :new]
    skip_before_filter :require_login, only: [:create, :new], raise: false
    skip_before_filter :authorize, only: [:create, :new], raise: false
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def admin_create
    @user = User.new

    if @user.save
      sign_in @user
      redirect_to(:controller =>"users", :action =>"index")
    else
      render template: "users/new"
    end
  end

  def index
    @users = User.all
  end

end
