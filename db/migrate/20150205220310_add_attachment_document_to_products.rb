class AddAttachmentDocumentToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :products, :document
  end
end
