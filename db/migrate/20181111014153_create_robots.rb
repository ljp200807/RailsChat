class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :user_id
      t.integer :user_score
      t.datetime :chat_time
      t.datetime :correspond_time
      t.integer :average_socre

      t.timestamps null: false
    end
  end
end
