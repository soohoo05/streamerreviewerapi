class AddStreamer < ActiveRecord::Migration[5.2]
  def change
    create_table :streamers do |t|
    t.string :username
    t.string :url
    t.string :category
    t.timestamps
  end
  end
end
