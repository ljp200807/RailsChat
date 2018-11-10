class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :user_id
      t.integer :user_score
      t.integer :chat_time
      t.integer :correspond_time
      t.integer :average_score

      t.timestamps null: false
    end
  end
end
