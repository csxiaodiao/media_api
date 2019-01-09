class MediaController < ApplicationController
  def search
    @q = Medium.ransack(params[:q])
    @medium = Kaminari.paginate_array(@q.result, total_count: @q.result.count).page(params[:page]).per(50)
    response.set_header('Content-Type', 'application/json')
  end
end
