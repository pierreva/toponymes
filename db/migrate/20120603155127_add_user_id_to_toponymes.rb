class AddUserIdToToponymes < ActiveRecord::Migration
  def change
    add_column :toponymes, :user_id, :integer
  end
end
