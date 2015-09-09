class AlterEmailOptions < ActiveRecord::Migration
  def up
  	change_column("users", "email", :string, :null => true, :default => false)
  end

  def down
  	change_column("users", "email", :string, :null => false, :default => false)
  end
end
