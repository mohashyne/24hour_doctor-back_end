class AddImageToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :image, :string
    change_column :doctors, :image, :string, limit: 255, null: true
    add_column :doctors, :image_url, :string
  end
end
