class EnqueteursController < ApplicationController
  def index
  end
  
  def new
  @enqueteur = Enqueteur.new
  end
  def create
  @enqueteur = Enqueteur.new(params[:Enqueteur])
  @enqueteur.save
  flash[:notice] = "Enqueteur has been created."
  redirect_to @enqueteur
  end
  def show
  @enqueteur = Enqueteur.find(params[:id])
  end
end
