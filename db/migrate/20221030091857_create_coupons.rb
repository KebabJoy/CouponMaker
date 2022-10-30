class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :pin, index: true
      t.datetime :last_usage
      t.integer :uses_left, default: 3
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
