class Nonage::UserFilesController < Nonage::BaseController
  before_action :set_directory, except: :index
  before_action :set_file, only: [:show, :edit, :update, :destroy]

  def index
    @directory_files = UserFile.where(user_id:current_user.id).paginate(page:params[:page])
  end

  def new
    @file = UserFile.new
  end

  def edit
  end

  def create
    if params[:user_file][:torrent_file].present?
      torrent = FileSource.save_file(params[:user_file][:torrent_file])
      params[:user_file][:file_id] = torrent.id
    else
      flash[:warn] = '请添加上传种子文件'
      return redirect_to new_nonage_user_directory_user_file_path(@directory.id)
    end
    if params[:user_file][:photo_file].present?
      cover = FileSource.save_file(params[:user_file][:photo_file])
      params[:user_file][:cover] = cover.file_path
    end
    @file = UserFile.new(user_file_params)
    if @file.save
      flash[:success] = '新种子信息创建成功'
      redirect_to nonage_directory_path(@directory.id)
    else
      flash[:warn] = '请填写完善表单信息'
      render :new
    end
  end

  def update
    if params[:user_file][:torrent_file].present?
      torrent = FileSource.save_file(params[:user_file][:torrent_file])
      params[:user_file][:file_id] = torrent.id
    elsif params[:user_file][:photo_file].present?
      cover = FileSource.save_file(params[:user_file][:photo_file])
      params[:user_file][:cover] = cover.file_path
    end
    if @file.update(user_file_params)
      flash[:success] = '表单信息更新成功'
      redirect_to nonage_directory_path(@directory.id)
    else
      flash[:warn] = '请填写完善表单信息'
      render :edit
    end
  end

  def destroy
    @file.destroy
    flash[:error] = '种子信息删除成功'
    redirect_to nonage_directory_path(@directory.id)
  end

  private
    def set_file
      @file = UserFile.find(params[:id])
    end

    def set_directory
      @directory = UserDirectory.find(params[:user_directory_id])
    end

    def user_file_params
      params.require(:user_file).permit(:user_id, :file_id, :directory_id, :full_name, :short_name, :cover)
    end
end
