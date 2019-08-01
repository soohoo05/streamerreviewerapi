class AddReview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.text :description
    	t.string :rating
    	t.integer :user_id
    	t.integer :streamer_id
      t.timestamps
    end

  add_index :reviews, [:user_id, :streamer_id]
  add_index :reviews, :streamer_id
  end
end
