class CatRentalRequestsController < ApplicationController
  def new

  end

  def create
  end

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end
