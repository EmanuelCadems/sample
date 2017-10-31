# frozen_string_literal: true

module V1
  class SitesController < ApplicationController
    def index
      sites = Site.select(:id, :url, :content, :created_at)
                  .paginate(page: params[:page], per_page: params[:per_page])
      render json: sites, status: 200
    end

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
