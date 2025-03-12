class ResizeAgencyLogo< ActiveRecord::Migration[5.2]
  def change
    ag_count = Agency.count
    Agency.all.each_with_index do |agency, index|
      p "Update " + index.to_s + " agency pictures of " + ag_count.to_s if index % 100 == 0
        if agency.logo.present? && agency.logo.file.exists?
          agency.logo.recreate_versions!
        end
    end
  end
end
