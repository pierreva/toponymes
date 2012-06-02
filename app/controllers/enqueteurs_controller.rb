class EnqueteursController < ApplicationController
  def index
  end

  def new
    @enqueteur = Enqueteur.new
  end
  def create
    @enqueteur = Enqueteur.new(params[:Enqueteur])
    if @enqueteur.save
      flash[:notice] = "Enqueteur has been created."
      redirect_to @enqueteur

    else
      flash[:alert] = "Enqueteur has not been created."
      render :action => "new"
    end
  end
  def show
    @enqueteur = Enqueteur.find(params[:id])
  end
end


