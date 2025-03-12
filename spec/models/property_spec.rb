# == Schema Information
#
# Table name: properties
#
#  id                             :bigint           not null, primary key
#  additional_area_en             :text
#  additional_area_ru             :text
#  area                           :float
#  area_unit                      :integer
#  attributes_en                  :text
#  attributes_ru                  :text
#  autotranslated_description_de  :boolean          default(FALSE)
#  autotranslated_description_en  :boolean          default(FALSE)
#  building_year                  :date
#  city_name_en                   :string
#  city_name_ru                   :string
#  construction_phase             :integer          indexed
#  country_name_en                :string
#  country_name_ru                :string
#  created_by                     :integer
#  description_en                 :string
#  description_ru                 :string
#  description_three_en           :text
#  description_three_ru           :text
#  description_two_en             :text
#  description_two_ru             :text
#  energy_efficiency_type         :integer
#  external_link                  :string
#  for_sale                       :boolean          default(TRUE)
#  h1_en                          :string
#  h1_ru                          :string
#  is_active                      :boolean          default(FALSE)
#  is_filler                      :boolean          default(FALSE)
#  last_repair                    :date
#  latitude                       :float
#  longitude                      :float
#  meta_description_en            :string
#  meta_description_ru            :string
#  moderated                      :boolean          default(FALSE)
#  page_h1_en                     :string
#  page_h1_ru                     :string
#  page_title_en                  :string
#  page_title_ru                  :string
#  parsed                         :boolean          default(FALSE), not null
#  plot_area                      :float
#  plot_area_unit                 :integer
#  price_on_request               :boolean          default(FALSE)
#  region_name_en                 :string
#  region_name_ru                 :string
#  rent_price_per_day             :integer
#  rent_price_per_month           :integer
#  rent_price_per_week            :integer
#  rent_price_unit_per_day        :string
#  rent_price_unit_per_month      :string
#  rent_price_unit_per_week       :string
#  room_count                     :integer
#  sale_price                     :bigint           default(0)
#  sale_price_unit                :string
#  short_page_title_en            :string
#  short_page_title_ru            :string
#  studio                         :boolean          default(FALSE)
#  subtype_en                     :string
#  subtype_ru                     :string
#  to_airport                     :integer
#  to_airport_unit                :integer
#  to_beach                       :integer
#  to_beach_unit                  :integer
#  to_food_stores                 :integer
#  to_food_stores_unit            :integer
#  to_historical_city_center      :integer
#  to_historical_city_center_unit :integer
#  to_medical_facilities          :integer
#  to_medical_facilities_unit     :integer
#  to_metro_station               :integer
#  to_metro_station_unit          :integer
#  to_nearest_big_city            :integer
#  to_nearest_big_city_unit       :integer
#  to_railroad_station            :integer
#  to_railroad_station_unit       :integer
#  to_sea                         :integer
#  to_sea_unit                    :integer
#  to_ski_lift                    :integer
#  to_ski_lift_unit               :integer
#  to_state_border                :integer
#  to_state_border_unit           :integer
#  updated_by                     :integer
#  video_link                     :string
#  created_at                     :datetime         not null, indexed
#  updated_at                     :datetime         not null
#  agency_id                      :bigint           indexed
#  city_id                        :bigint           indexed
#  country_id                     :bigint           indexed
#  property_type_id               :bigint           indexed
#  region_id                      :bigint           indexed
#

require 'shared_examples/seo_path_method'

RSpec.describe Property, type: :model do
  describe '#seo_path' do
    before(:all) do
      @test_obj = Property.new
      @test_obj.id = 5_000_000 # Просто большое id, которое будет достигнуто не скоро
      @test_obj.city = nil
      @test_obj.region = nil
      @test_obj.country = nil
    end

    context 'without locale' do

      before(:all) do
        @test_obj.city = nil
        @test_obj.region = nil
        @test_obj.country = nil
      end

      include_examples "check #seo_path", "", ""
    end

    context 'with country' do

      before(:all) do
        country = Country.new
        @test_obj.country = country
        country.slug = 'country'
        @test_obj.city = nil
        @test_obj.region = nil
      end

      include_examples "check #seo_path", "/ru/country/5000000", "/en/country/5000000"

      context 'with country and region' do
        before(:all) do
          region = Region.new
          @test_obj.region = region
          @test_obj.region.country = @test_obj.country
          region.slug = 'region'
          @test_obj.city = nil
        end

        include_examples "check #seo_path", "/ru/country/r/region/5000000", "/en/country/r/region/5000000"

        context 'with country and region and city' do
          before(:all) do
            city = City.new
            @test_obj.city = city
            @test_obj.city.region = @test_obj.region
            city.slug = 'city'
          end

          include_examples "check #seo_path", "/ru/country/c/city/5000000", "/en/country/c/city/5000000"
        end
      end
    end
  end
end
