class AddImageToWants < ActiveRecord::Migration[6.1]
  def change
    add_column :wants, :image, :string
  end
end
