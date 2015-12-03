class RenameToSpam < ActiveRecord::Migration
  def change
     rename_table :spam, :spams
   end 
end
