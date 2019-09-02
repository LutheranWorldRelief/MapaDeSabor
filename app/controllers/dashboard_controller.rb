require 'nokogiri'
require 'open-uri'

class DashboardController < ApplicationController
  before_action :filter, only: [:new_index]
  before_action :set_place, only: [:show]
  respond_to :js

  def index
  end

  def about_us
    @page = Page.first rescue nil
    render layout: "landing_cocoa"
  end

  def model
    nil
  end

  def new_index
    @price = ""
    @pc = ""
    @pcp = ""

    doc = Nokogiri::HTML(open('https://es.investing.com/commodities/us-cocoa'))
    doc.search('.pid-8894-last').each do |price|
      @price = price.content
    end
    doc.search('.pid-8894-pc').each do |pc|
      @pc = pc.content
    end
    doc.search('.pid-8894-pcp').each do |pcp|
      @pcp = pcp.content
    end
    render layout: "landing_cocoa"
  end

  def filter
    @places = Place.all
    @place_links = Place.all
    @producers = Producer.all
    @countries = Country.all
    @flavors = Flavor.where(is_visible: true)
    @points = []

    query_map = ""
    conditions_maps = [query_map]

    if params[:filter].present?

      if params[:filter][:flavor].present?
        
        ids = Flavor.where(id: params[:filter][:flavor]).ids
        
        if ids.size > 0
          if query_map.blank?
            query_map += " flavor_id IN (?) "
          else
            query_map += " AND flavor_id IN (?) "
          end
          conditions_maps << ids
          @flavors = @flavors.where(id: ids)
        end
      end

      if params[:filter][:country].present?
        ids = Country.where(id: params[:filter][:country]).ids

        if ids.size > 0
          if query_map.blank?
            query_map += " country_id IN (?) "
          else
            query_map += " AND country_id IN (?) "
          end
          conditions_maps << ids
        end
      end

      if params[:filter][:box_fermentation].present?
        if params[:filter][:box_fermentation] == "on"
          if query_map.blank?
            query_map += " fermentation_type = ? "
          else
            query_map += " AND fermentation_type = ? "
          end
          conditions_maps << 0
        end
      end

      if params[:filter][:basket_fermentation].present?
        if params[:filter][:basket_fermentation] == "on"
          if query_map.blank?
            query_map += " fermentation_type = ? "
          else
            query_map += " AND fermentation_type = ? "
          end
          conditions_maps << 2
        end
      end

      if params[:filter][:tray_fermentation].present?
        if params[:filter][:tray_fermentation] == "on"
          if query_map.blank?
            query_map += " fermentation_type = ? "
          else
            query_map += " AND fermentation_type = ? "
          end
          conditions_maps << 1
        end
      end

    end
    
    conditions_maps[0] = query_map

    puts "------------------"
    puts "#{conditions_maps}"
    puts "------------------"

    unless conditions_maps[0].blank?
      @places = @places.where(conditions_maps)
    end

    @places.each do |p|
      if p.x_axis.present? && p.y_axis.present?
        color = (p.fermentation_type.nil? ? '#FFFFFF' : Place::FCOLORS[p.fermentation_type.to_sym] )
        @points << {x: p.x_axis, y: p.y_axis, color: color, myData: "#{p.name}, #{p.country.name}", slug: "#{p.slug}"}
      end
    end

  end

  def search
    @place_links = Place.limit(8)
    if params[:place].present?
      @place_links = @place_links.where("name ILIKE ? ", "%#{params[:place][:search]}%") rescue 0
    end
  end

  def show
    @places = Place.all
    

    respond_to do |format|
      format.html do
        render layout: "landing_cocoa"
      end
      format.pdf do
        render pdf: "file_name",
          layout: "pdf"
      end
    end
  end

  private

    def set_place
      @place = Place.friendly.find(params[:id])
    end

end
