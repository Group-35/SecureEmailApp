class AddDateToEmails < ActiveRecord::Migration
  def change
    add_column(:emails, :created_at, :datetime)
    add_column(:emails, :updated_at, :datetime)
  end
end
