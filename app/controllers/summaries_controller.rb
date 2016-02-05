class SummariesController < ApplicationController

	def index
		 @user= current_user
		 @summaries= Summary.all.select {|i| i.id == session[:user_id]}
	end

	def new
		@summary = Summary.new
		@user = current_user
		@sites = Site.all
	end

	def create
		@summary = Summary.new(summary_params)
		@sites = Site.where(:id => params[:selected_site])
		@summary.sites << @sites
		if @summary.save        	
        	flash[:success] = "Summary created"
        	redirect_to action: 'index'
    	else
        	render 'new'
    	end
	end

	def edit
		@summary = Summary.find(params[:id])
		@sites = Site.all
	end

	def update
		@summary = Summary.find(params[:id])
		@sites = Site.where(:id => params[:selected_site])
		@summary.sites.destroy_all
		@summary.sites << @sites

		if @summary.update_attributes(summary_params)
			flash[:success] = "Summary updated"
			redirect_to action: 'index'
		else
			render 'edit'
		end
	end

	def display
        @summary = Summary.find(params[:id])
        @sites = @summary.sites

    end

	private
    def summary_params
        params.require(:summary).permit(:name, :site_id, :description, :user_id)
    end

end
