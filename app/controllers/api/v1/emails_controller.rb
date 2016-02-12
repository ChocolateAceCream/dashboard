class Api::V1::EmailsController < ApplicationController
  def index
  	@email = Email.all
    @reply =[]
    @email.each do |email|
      @reply<< [email.id, email.server_name,email.imap, email.imap_port, email.smtp, email.smtp_port, email.account_name, email.account_password]
    end
    respond_to do |format|
        format.json { render :json => @reply}
    end
  end


  def show
    @site = Site.all
	    respond_to do |format|
	      format.json { render :json => [@email.server_name,@email.imap, @email.imap_port, @email.smtp, @email.smtp_port, @email.account_name, @email.account_password]}
	    end
  end

end