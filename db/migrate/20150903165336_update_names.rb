class UpdateNames < ActiveRecord::Migration
  def up
  	change_column("users", "first_name", :string, :default => "", :null => "false")
  	change_column("users", "last_name", :string, :default => "", :null => "false")
  	change_column("users", "username", :string, :default => "", :null => "false")
  end

  def down
  	
  end
end
