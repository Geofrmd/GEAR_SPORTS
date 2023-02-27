class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :location
      t.string :picture_url
      t.string :sport_category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
