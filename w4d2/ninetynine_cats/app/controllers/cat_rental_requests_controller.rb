class CatRentalRequestsController < ApplicationController
  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_url(current_cat)
    else
      render :new
    end
  end

  def current_cat
    Cat.find_by(id: params[:cat_id])
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request)
      .permit(:cat_id, :start_date, :end_date, :status)
  end
end
