class CreateSpamTable < ActiveRecord::Migration
  def change
    create_table :spam do |t|
      t.integer :belong_to
      t.integer :bad_user
    end
  end
end
