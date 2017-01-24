class Nonage::BoardsController < Nonage::BaseController

  def index
  end

  def directory
    @directory = UserDirectory.find(params[:directory_id])
    @directory_files = UserFile.where(user_id:current_user.id,directory_id:params[:directory_id]).paginate(page:params[:page])
  end

end