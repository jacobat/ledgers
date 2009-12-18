class TransactionsController < ApplicationController
  
  def index
    @transactions = Transaction.all(:order => "created_on DESC")
  end
end
