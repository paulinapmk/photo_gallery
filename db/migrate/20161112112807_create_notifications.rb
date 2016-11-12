class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notified_by, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.integer :comment_id
      t.string :notice_type
      t.boolean :read, default: false

      t.timestamps null: false
    end
  end
end
