# == Schema Information
#
# Table name: countries
#
#  id                                    :bigint           not null, primary key
#  active_and_moderated_properties_count :integer          default(0), not null
#  active_properties_count               :integer          default(0), not null
#  coming_soon                           :boolean          default(TRUE)
#  continent                             :string(2)        default(""), indexed
#  created_by                            :integer
#  currencycode                          :string(3)        default("")
#  currencyname                          :string(20)       default("")
#  image                                 :string
#  is_active                             :boolean          default(FALSE)
#  is_popular                            :boolean          default(FALSE)
#  iso_alpha2                            :string(2)        default("")
#  languages                             :string(200)      default("")
#  latitude                              :float            default(0.0)
#  longitude                             :float            default(0.0)
#  name                                  :string(200)      default(""), indexed
#  properties_count                      :integer          indexed
#  show_agencies_on_website              :boolean          default(TRUE)
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
#  capital_id                            :integer
#

require 'shared_examples/seo_path_method'

RSpec.describe Country, type: :model do
  before(:all) do
    @test_obj = Country.new
    @test_obj.slug = 'spain'
  end

  context 'seo_path' do
    include_examples "check #seo_path", "/ru/spain", "/en/spain"
  end
end
