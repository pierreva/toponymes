class ToponymesController < ApplicationController
  before_filter :find_enqueteur
  before_filter :find_toponyme, :only => [:show,
    :edit,
    :update,
    :destroy]
    def new
      @toponyme = @enqueteur.toponymes.build
    end
    def create
      @toponyme = @enqueteur.toponymes.build(params[:toponyme])
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
    private
    def find_enqueteur
      @enqueteur = Enqueteur.find(params[:enqueteur_id])
    end
    def find_toponyme
      @toponyme = @enqueteur.toponymes.find(params[:id])
    end
  end
