class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :belong
      t.integer :contact
    end
  end
end
