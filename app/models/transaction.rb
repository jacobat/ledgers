class Transaction < ActiveRecord::Base
  validates_uniqueness_of :text, :on => :create, :scope => [:account_id, :amount, :balance]
end
