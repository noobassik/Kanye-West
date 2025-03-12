require 'rails_helper'

RSpec.describe PropertiesFilterUrlGenerator do
  describe '#perform' do
    context 'where ru is the base locale' do
      before(:all) do
        I18n.locale = :ru
      end

      it 'and path is /:locale/:property_supertype' do
        params = ActionController::Parameters.new(property_supertype_id: PropertySupertype::RESIDENTIAL)
        result_path = PropertiesFilterUrlGenerator.new(params).perform

        expect(result_path).to eq('/ru/residential')
      end

      it 'and path is /:locale/:country_url' do
        params = ActionController::Parameters.new(query: 'Испания')
        result_path = PropertiesFilterUrlGenerator.new(params).perform

        expect(result_path).to eq('/ru/spain')
      end

      it 'and path is /:locale/:country_url/:property_supertype' do
        params = ActionController::Parameters.new(property_supertype_id: PropertySupertype::RESIDENTIAL,
                                                  query: 'Испания')
        result_path = PropertiesFilterUrlGenerator.new(params).perform

        expect(result_path).to eq('/ru/spain/residential')
      end

      it 'and path is /:locale/:country_url/r/:region_url/:property_supertype' do
        params = ActionController::Parameters.new(property_supertype_id: PropertySupertype::RESIDENTIAL,
                                                  query: 'Валенсия, Испания')
        result_path = PropertiesFilterUrlGenerator.new(params).perform

        expect(result_path).to eq('/ru/spain/r/valenciana/residential')
      end

      it '/:locale/:country_url/c/:city_url/:property_supertype' do
        params = ActionController::Parameters.new(property_supertype_id: PropertySupertype::RESIDENTIAL,
                                                  query: 'Аликанте, Валенсия, Испания')
        result_path = PropertiesFilterUrlGenerator.new(params).perform

        expect(result_path).to eq('/ru/spain/c/alicante/residential')
      end

      it 'and path is /:locale/:country_url/r/:region_url' do
        params = ActionController::Parameters.new(query: 'Валенсия, Испания')
        result_path = PropertiesFilterUrlGenerator.new(params).perform

        expect(result_path).to eq('/ru/spain/r/valenciana')
      end

      it 'and path is /:locale/:country_url/c/:city_url' do
        params = ActionController::Parameters.new(query: 'Аликанте, Валенсия, Испания')
        result_path = PropertiesFilterUrlGenerator.new(params).perform

        expect(result_path).to eq('/ru/spain/c/alicante')
      end

      it 'and path is /:locale/:country_url?page=2' do
        params = ActionController::Parameters.new(query: 'Испания', page: 2)
        result_path = PropertiesFilterUrlGenerator.new(params).perform

        expect(result_path).to eq('/ru/spain?page=2')
      end

      it 'and path is /:locale/:country_url with useless get params' do
        params = ActionController::Parameters.new(query: 'Испания', country_id: 2)
        result_path = PropertiesFilterUrlGenerator.new(params).perform

        expect(result_path).to eq('/ru/spain')
      end
    end
  end
end
