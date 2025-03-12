class AddUrlIndexesToLocations < ActiveRecord::Migration[5.2]
  def change
    # Region.select(:country_id, :title_en, :title_ru, :latitude, :longitude)
    # .group(:country_id, :title_en, :title_ru, :latitude, :longitude)
    # .having("count(*) > 1")

    p '--- Destroy duplicated cities'
    City.select(:region_id, :title_en, :title_ru, :latitude, :longitude)
        .group(:region_id, :title_en, :title_ru, :latitude, :longitude)
        .having("count(*) > 1").each do |city|

      City.where(region_id: city.region_id,
                 title_en: city.title_en,
                 title_ru: city.title_ru,
                 latitude: city.latitude,
                 longitude: city.longitude).each_with_index do |duplicated_city, index|
        if index > 0
          duplicated_city.destroy
        end
      end

    end

    p '--- Resolve duplicated region urls'
    duplicated_region_urls = Region.select(:url).group(:url).having("count(*) > 1").map(&:url)
    duplicated_region_urls_count = duplicated_region_urls.count

    duplicated_region_urls.each_with_index do |url, url_index|
      p "--- Region url #{url_index} of #{duplicated_region_urls_count}" if url_index % 10 == 0
      Region.where(slug: url).each_with_index do |region, index|
        if index > 0
          region.update(slug: "#{region.url}-#{index}")
        end
      end
    end


    p '--- Resolve duplicated cities urls'
    duplicated_city_urls = City.select(:url).group(:url).having("count(*) > 1").map(&:url)
    duplicated_city_urls_count = duplicated_city_urls.count
    duplicated_city_urls.each_with_index do |url, url_index|
      p "--- City url #{url_index} of #{duplicated_city_urls_count}" if url_index % 20 == 0
      City.where(slug: url).each_with_index do |city, index|
        if index > 0
          city.update(slug: "#{city.url}-#{index}")
        end
      end
    end

    add_index :cities, :url, unique: true
    add_index :regions, :url, unique: true
    add_index :countries, :url, unique: true
  end
end
