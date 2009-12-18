class TransactionsController < ApplicationController
  
  def index
    @tags = Tag.all
    @transactions = Transaction.all(:order => "created_on DESC, ID DESC", :limit => 20)
  end
end
