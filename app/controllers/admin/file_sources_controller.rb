class Admin::FileSourcesController < Admin::BaseController
  before_action :set_file_source, only: [:show, :edit, :update, :destroy]

  # GET /file_sources
  # GET /file_sources.json
  def index
    @file_sources = FileSource.all
  end

  # GET /file_sources/1
  # GET /file_sources/1.json
  def show
  end

  # GET /file_sources/new
  def new
    @file_source = FileSource.new
  end

  # GET /file_sources/1/edit
  def edit
  end

  # POST /file_sources
  # POST /file_sources.json
  def create
    @file_source = FileSource.new(file_source_params)

    respond_to do |format|
      if @file_source.save
        format.html { redirect_to @file_source, notice: 'File source was successfully created.' }
        format.json { render :show, status: :created, location: @file_source }
      else
        format.html { render :new }
        format.json { render json: @file_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_sources/1
  # PATCH/PUT /file_sources/1.json
  def update
    respond_to do |format|
      if @file_source.update(file_source_params)
        format.html { redirect_to @file_source, notice: 'File source was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_source }
      else
        format.html { render :edit }
        format.json { render json: @file_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_sources/1
  # DELETE /file_sources/1.json
  def destroy
    @file_source.destroy
    respond_to do |format|
      format.html { redirect_to file_sources_url, notice: 'File source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_source
      @file_source = FileSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_source_params
      params.require(:file_source).permit(:file_name, :file_type, :file_size, :file_md5, :file_path)
    end
end
