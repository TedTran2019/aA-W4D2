class CatRentalRequestsController < ApplicationController
  def new
    @cat_rental_request = CatRentalRequest.new
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

  def approve
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request
      @cat_rental_request.approve!
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      redirect_to cats_url
    end
  end 

  def deny
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request
      @cat_rental_request.deny!
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      redirect_to cats_url
    end
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:status, :start_date, :end_date, :cat_id)
  end
end
