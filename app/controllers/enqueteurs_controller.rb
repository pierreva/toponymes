class EnqueteursController < ApplicationController
  def index
    @enqueteurs = Enqueteur.all
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
  def edit
  @enqueteur = Enqueteur.find(params[:id])
  end
  def update
    @enqueteur = Enqueteur.find(params[:id])
    if @enqueteur.update_attributes(params[:enqueteur])
    flash[:notice] = "Enqueteur has been updated."
    redirect_to @enqueteur
    else
    flash[:alert] = "Enqueteur has not been updated."
    render :action => "edit"
    end
  end
  def destroy
  @enqueteur = Enqueteur.find(params[:id])
  @enqueteur.destroy
  flash[:notice] = "Enqueteur has been deleted."
  redirect_to enqueteurs_path
  end
end


