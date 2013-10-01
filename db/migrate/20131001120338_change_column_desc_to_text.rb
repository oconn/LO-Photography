class ChangeColumnDescToText < ActiveRecord::Migration
  def change
  	change_column :galleries, :description, :text
  	change_column :posts,     :description, :text
  end
end
