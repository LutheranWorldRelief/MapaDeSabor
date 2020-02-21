# == Schema Information
#
# Table name: places
#
#  id                      :integer          not null, primary key
#  country_id              :integer
#  producer_id             :integer
#  name                    :string
#  long_name               :string
#  description             :string
#  latitude                :string
#  longitude               :string
#  content_left            :text
#  content_right           :text
#  main_image_file_name    :string
#  main_image_content_type :string
#  main_image_file_size    :integer
#  main_image_updated_at   :datetime
#  youtube_url             :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  x_axis                  :float
#  y_axis                  :float
#  fermentation_type       :integer
#  slug                    :string
#  quality_flavors         :text
#  harvest                 :text
#  scheme                  :text
#  flavor_id               :integer
#  description_eng         :text
#  quality_flavors_eng     :text
#  content_right_eng       :text
#  harvest_eng             :text
#  content_left_eng        :text
#  scheme_eng              :text
#  featured                :string
#

class Place < ApplicationRecord
  mount_uploader :featured, ImageUploader
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  after_save :add_country

  belongs_to :flavor
  belongs_to :producer
  belongs_to :country
  validates :name, presence: true

  has_attached_file :main_image, styles: { original: '960>', slider: '300x200!' }
  validates_attachment_content_type :main_image, content_type: /\Aimage/

  has_attached_file :graphic_one, styles: { original: '960>', slider: '300x200!' }
  validates_attachment_content_type :main_image, content_type: /\Aimage/

  has_attached_file :graphic_two, styles: { original: '960>', slider: '300x200!' }
  validates_attachment_content_type :main_image, content_type: /\Aimage/

  validates :youtube_url,
            format: URI.regexp(%w(http https)),
            unless: proc { |o| o.youtube_url.blank? }

  enum fermentation_type: [:box_fermentation, :tray_fermentation, :basket_fermentation]

  def add_country
    if self.country.nil?
      self.country_id = self.producer.country_id
      self.save
    end
  end


  FCOLORS = {
    box_fermentation: '#08486e',
    tray_fermentation: '#f87e28',
    basket_fermentation: '#00a1d6'
  }

  ransacker :name, type: :string do
    Arel.sql("UNACCENT(\"#{table_name}\".\"name\")")
  end

  ransacker :long_name, type: :string do
    Arel.sql("UNACCENT(\"#{table_name}\".\"long_name\")")
  end

  ransacker :description, type: :string do
    Arel.sql("UNACCENT(\"#{table_name}\".\"description\")")
  end

  ransacker :content_left, type: :text do
    Arel.sql("UNACCENT(\"#{table_name}\".\"content_left\")")
  end

  ransacker :content_right, type: :text do
    Arel.sql("UNACCENT(\"#{table_name}\".\"content_right\")")
  end

  ransacker :quality_flavors, type: :text do
    Arel.sql("UNACCENT(\"#{table_name}\".\"quality_flavors\")")
  end

  ransacker :harvest, type: :text do
    Arel.sql("UNACCENT(\"#{table_name}\".\"harvest\")")
  end

end
