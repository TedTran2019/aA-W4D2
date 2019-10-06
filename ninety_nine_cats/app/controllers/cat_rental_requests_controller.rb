class CatRentalRequestsController < ApplicationController
  def new
    @cat_rental_request = CatRentalRequest.new
    @cat_rental_request.cat_id = params[:cat_id]
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      render :new
    end
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:status, :start_date, :end_date, :cat_id)
  end
end
