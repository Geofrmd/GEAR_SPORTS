class AddPictureSeedToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :picture_seed, :string
  end
end
