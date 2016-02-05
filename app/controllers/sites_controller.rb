class SitesController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	def index
		 @sites= Site.all
	end

	def new
		@site = Site.new
		@summary= Summary.all
	end

	def create
		@site = Site.new(site_params)
		if @site.save        	
        	flash[:success] = "New Sites created"
        	#redirect_to salesreps_path(@site)
        	redirect_to action: 'index'
    	else
        	render 'new'
    	end
	end

	def edit
		@site = Site.find(params[:id])
	end

	def update
		@site = Site.find(params[:id])

		if @site.update_attributes(site_params)
			flash[:success] = "Sites info updated"
			redirect_to action: 'index'
		else
			render 'edit'
		end
	end

	private
    def site_params
        params.require(:site).permit(:name, :description, :ping, :ip)
    end

end
