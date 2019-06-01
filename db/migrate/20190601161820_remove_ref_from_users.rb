class RemoveRefFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :trip, foreign_key: true
  end
end
