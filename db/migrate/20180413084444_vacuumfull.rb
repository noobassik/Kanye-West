class Vacuumfull < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!
  def change
    Rake::Task['vacuum:full'].execute
  end
end
