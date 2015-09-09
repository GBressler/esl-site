class UpdatePosts < ActiveRecord::Migration
  def up
  	add_column("posts", "username", :string, :limit => 25, :default => "", :null => false)
  	add_column("posts", "first_name", :string, :limit => 25, :default => "", :null => false)
  	add_column("posts", "last_name", :string, :limit => 50, :default => "", :null => false)
  end

  def down
  	remove_column("posts", "last_name")
  	remove_column("posts", "first_name")
  	remove_column("posts", "username")
  end
end
