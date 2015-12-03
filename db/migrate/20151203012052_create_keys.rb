class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.text :public_key
      t.text :private_key
    end
  end
end
