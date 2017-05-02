class Nonage::UserDirectoriesController < Nonage::BaseController
  before_action :set_user_directory, only: [:show, :edit, :update, :destroy]

  def index
    @directories = UserDirectory.where(user_id:current_user.id)
  end

  def show
  end

  def new
    @directory = UserDirectory.new
  end

  def edit
  end

  def create
    if params[:user_directory][:cover_file].present?
      cover = FileSource.save_file(params[:user_directory][:cover_file])
      params[:user_directory][:cover] = cover.file_path
    end
    @directory = UserDirectory.new(user_directory_params)
    if @directory.save
      redirect_to nonage_user_directories_path, notice: 'User directory was successfully created.'
    else
      render :new
    end
  end

  def update
    if params[:user_directory][:cover_file].present?
      cover = FileSource.save_file(params[:user_directory][:cover_file])
      params[:user_directory][:cover] = cover.file_path
    end
    if @user_directory.update(user_directory_params)
      redirect_to nonage_user_directories_path, notice: 'User directory was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @directory.destroy
    redirect_to nonage_user_directories_path, notice: 'User directory was successfully destroyed.'
  end

  private
    def set_user_directory
      @directory = UserDirectory.find(params[:id])
    end

    def user_directory_params
      params.require(:user_directory).permit(:user_id, :name, :parent_id, :cover)
    end
end
