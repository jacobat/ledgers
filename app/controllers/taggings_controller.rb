class TaggingsController < ApplicationController
  
  def update
    logger.debug(params[:tags].inspect)
    t = Transaction.find(params[:transaction_id])
    t.update_attribute(:tag_list, params[:tags])
    logger.debug(t.tags.inspect)
    redirect_to :back
  end
end
