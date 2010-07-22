class Transaction < ActiveRecord::Base
  acts_as_taggable_on :tags
  validates_uniqueness_of :text, :on => :create, :scope => [:account_id, :amount, :balance]
  
  def afstemt=(a)
    
  end
end
