class ToponymesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_enqueteur
  before_filter :find_toponyme, :only => [:show, :edit, :update, :destroy]
  before_filter :authorize_create!, :only => [:new, :create]

  def new
    @toponyme = @enqueteur.toponymes.build
  end
  def create
    @toponyme = @enqueteur.toponymes.build(params[:toponyme].merge!(:user => current_user))
    if @toponyme.save
      flash[:notice] = "Toponyme has been created."
      redirect_to [@enqueteur, @toponyme]
    else
      flash[:alert] = "Toponyme has not been created."
      render :action => "new"
    end
  end
  def show
  end
  def edit
  end
  def update
    if @toponyme.update_attributes(params[:toponyme])
      flash[:notice] = "Toponyme has been updated."
      redirect_to [@enqueteur, @toponyme]
    else
      flash[:alert] = "Toponyme has not been updated."
      render :action => "edit"
    end
  end
  private
  def find_enqueteur
    @enqueteur = Enqueteur.find(params[:enqueteur_id])
  end
  def find_toponyme
    @toponyme = @enqueteur.toponymes.find(params[:id])
  end
  def authorize_create!
    if !current_user.admin? && cannot?("create toponymes".to_sym, @enqueteur)
      flash[:alert] = "You cannot create toponymes on this enqueteur."
      redirect_to @enqueteur
    end
  end
end
