class WelcomeController < ApplicationController
  layout 'web'

  def index
    @torrents = UserFile.all
  end

  def download
    @file = UserFile.find(params[:id])
    @user = @file.user
  end

  def torrent_download
    @file = UserFile.find(params[:id])
    @file.increment!(:down_count)
    redirect_to "#{Settings.host}/#{@file.torrent.file_path}"
  end
end
