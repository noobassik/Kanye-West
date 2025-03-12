# == Schema Information
#
# Table name: regions
#
#  id                                    :bigint           not null, primary key
#  active_and_moderated_properties_count :integer          default(0), not null
#  active_properties_count               :integer          default(0), not null
#  cities_count                          :integer          default(0)
#  coming_soon                           :boolean          default(TRUE)
#  created_by                            :integer
#  image                                 :string
#  is_active                             :boolean          default(FALSE)
#  is_popular                            :boolean          default(FALSE)
#  latitude                              :float            default(0.0)
#  longitude                             :float            default(0.0)
#  name                                  :string(200)      default(""), indexed
#  properties_count                      :integer          indexed
#  slug                                  :string           default(""), indexed
#  title_en                              :string(200)      default(""), indexed
#  title_genitive_en                     :string
#  title_genitive_ru                     :string
#  title_prepositional_en                :string
#  title_prepositional_ru                :string
#  title_ru                              :string(200)      default(""), indexed
#  updated_by                            :integer
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  country_id                            :bigint           indexed
#

require 'shared_examples/seo_path_method'

RSpec.describe Region, type: :model do

  context 'seo_path' do
    context 'with country' do

      before(:all) do
        @test_obj = Region.new
        @test_obj.slug = 'andalysiya'

        country = Country.new
        country.slug = 'spain'
        @test_obj.country = country
      end

      include_examples "check #seo_path", "/ru/spain/r/andalysiya", "/en/spain/r/andalysiya"
    end


    context 'without country' do
      before(:all) do
        @test_obj = Region.new
        @test_obj.slug = 'andalysiya'
      end

      include_examples "check #seo_path", "/ru/r/andalysiya", "/en/r/andalysiya"
    end
  end
end
