class SignupsController < ApplicationController

  def new
    @signup = Signup.new
  end


  def create
    # add_email
    @email = params[:signup][:email]
    respond_to do |format|
      format.js { render :js => "home_submit_clicked();" }
    end
    # redirect_to #home_alert

  end

  private

  def add_email
    @email = params[:signup][:email]
    puts @email
    email = @email.to_s
    gibbon = Gibbon::Request.new(api_key: '0fce4dbfcd933ca8ae2d4ec206b09b36-us13')
    gibbon.lists("4f60a0f81b").members.create(body: {email_address: email, status: "subscribed", merge_fields: {FNAME: "", LNAME: ""}})
    render :html => "<script>alert()</script>".html_safe
  end

end


