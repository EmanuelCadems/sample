module V1
  class SitesController < ApplicationController
    def create
      site = Site.new(site_params)
      if site.save
        render json: site, status: 201, location: v1_site_url(site)
      else
        render json: { errors: site.errors.full_messages }, status: 422
      end
    end


    private

    def site_params
      params.require(:site).permit(:url)
    end
  end
end
