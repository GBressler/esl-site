class AlterUsers < ActiveRecord::Migration
  def up
  	add_column("users", "first_name")
  	add_column("users", "last_name")
  	change_column("users", "email", :string, :default => "", :null => "true")
  	add_column("users", "username", :string, :default => "", :null => "false")
  	#add_index("users", "username")

  end

  def down
  	#remove_index("users", "username")
  	remove_column("users", "username")
  	#change_column("users", "email", :default => "")
  	remove_column("users", "last_name")
  	remove_column("users", "first_name")
  end
end
