class AddAttachmentImageToImages < ActiveRecord::Migration[5.2]
  def change
    add_attachment :images, :image
  end
end
