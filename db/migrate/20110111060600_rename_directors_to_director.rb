class RenameDirectorsToDirector < ActiveRecord::Migration
  def self.up
    rename_column(:movies,:directors,:director)
  end

  def self.down
    rename_column(:movies,:director,:directors)
  end
end
