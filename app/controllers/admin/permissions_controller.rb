class Admin::PermissionsController < Admin::BaseController
  before_filter :find_user
  def index
    @ability = Ability.new(@user)
    @enqueteurs = Enqueteur.all
  end
  def update
    @user.permissions.clear
    params[:permissions].each do |id, permissions|
      enqueteur = Enqueteur.find(id)
      permissions.each do |permission, checked|
        Permission.create!(:user => @user,
        :thing => enqueteur,
        :action => permission)
      end
    end
    flash[:notice] = "Permissions updated."
    redirect_to admin_user_permissions_path
  end
  private
  def find_user
    @user = User.find(params[:user_id])
  end
end
