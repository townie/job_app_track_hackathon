class AddWebsiteContentToPost < ActiveRecord::Migration
  def change
    add_column :posts, :website_content, :text
  end
end
