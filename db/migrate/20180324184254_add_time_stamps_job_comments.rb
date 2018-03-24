class AddTimeStampsJobComments < ActiveRecord::Migration[5.1]
  def change
    add_column :job_comments, :created_at, :datetime, null: false
    add_column :job_comments, :updated_at, :datetime, null: false
  end
end
