class MediaController < ApplicationController
  def search
    @q = Medium.ransack(params[:q])
    @medium = @q.result.page(params[:page]).per(50)        
  end
end
