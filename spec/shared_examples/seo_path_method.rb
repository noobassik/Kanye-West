require 'rails_helper'

RSpec.shared_examples "check #seo_path" do |expected_seo_path_ru, expected_seo_path_en|
  it 'ru lacale' do
    I18n.locale = :ru

    expect(@test_obj.seo_path).to eq(expected_seo_path_ru)
  end

  it 'en lacale' do
    I18n.locale = :en

    expect(@test_obj.seo_path).to eq(expected_seo_path_en)
  end
end
