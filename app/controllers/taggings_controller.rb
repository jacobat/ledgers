class TaggingsController < ApplicationController
  
  def update
    t = Transaction.find(params[:transaction_id])
    t.update_attribute(:tag_list, params[:tags])
    redirect_to :back
  end
end
