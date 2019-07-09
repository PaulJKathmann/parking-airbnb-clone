class RenamePictureToPhoto < ActiveRecord::Migration[5.2]
  def change
     rename_column :spaces, :picture, :photo
  end
end
