# == Schema Information
#
# Table name: cities
#
#  id                                    :bigint           not null, primary key
#  active_and_moderated_properties_count :integer          default(0), not null
#  active_properties_count               :integer          default(0), not null
#  admin1                                :string(20)       default("")
#  admin2                                :string(80)       default("")
#  admin3                                :string(20)       default("")
#  admin4                                :string(20)       default("")
#  coming_soon                           :boolean          default(TRUE)
#  continent                             :string(20)       indexed
#  created_by                            :integer
#  fcode                                 :string(10)       default("")
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
#  region_id                             :bigint           indexed
#

require 'shared_examples/seo_path_method'

RSpec.describe City, type: :model do

  describe '#seo_path' do
    context 'without region' do

      before(:all) do
        @test_obj = City.new
        @test_obj.slug = 'malaga'
      end

      include_examples "check #seo_path", "/ru/c/malaga", "/en/c/malaga"
    end

    context 'with region' do

      before(:all) do
        @test_obj = City.new
        @test_obj.slug = 'malaga'

        country = Country.new
        country.slug = 'spain'

        region = Region.new
        region.slug = 'andalysiya'
        region.country = country

        @test_obj.region = region
      end

      include_examples "check #seo_path", "/ru/spain/c/malaga", "/en/spain/c/malaga"
    end

  end
end
