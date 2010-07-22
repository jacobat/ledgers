class TaggingsController < ApplicationController
  
  def update
    t = Transaction.find(params[:transaction_id])
    t.update_attribute(:tag_list, params[:tags])
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render :text => :ok, :status => 202 }
    end
  end
end
