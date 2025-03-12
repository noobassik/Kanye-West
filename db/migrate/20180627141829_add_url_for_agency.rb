class AddUrlForAgency < ActiveRecord::Migration[5.1]
  def change
    add_column :agencies, :url, :string
    add_index :agencies, :url, unique: true
    urls = []

    Agency.all.order(:name_en).each do |ag|
      name = Translit.convert(ag.name_en.present? ? ag.name_en : ag.name_ru, :english)
      ag.url = name.parameterize

      count = urls.count(ag.url)
      tail_url = count == 0 ? "" : "-" + (count + 1).to_s
      urls << ag.url
      ag.url += tail_url

      ag.save
    end
  end
end
