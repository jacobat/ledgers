class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :account_id
      t.integer :amount
      t.string :text
      t.date :created_on
      t.integer :balance
      
      t.timestamps
    end
    
    add_index :transactions, :account_id
  end

  def self.down
    remove_index :transactions, :account_id
    drop_table :transactions
  end
end
