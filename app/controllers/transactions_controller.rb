class TransactionsController < ApplicationController
  
  def index
    @tags = Tag.all
    @transactions = Transaction.paginate(:page => params[:page], :order => "created_on DESC, transactions.ID DESC", :per_page => 20)
  end
  
  def untagged
    @tags = Tag.all
    @transactions = Transaction.all(:order => "created_on DESC, transactions.ID DESC").select{|t| t.tags.empty? }
    render :index
  end
  
  def by_amount
    @tags = Tag.all
    @transactions = Transaction.all(:conditions => ['created_on > ?', 3.months.ago], :order => "amount DESC")
    render :index
  end
end
