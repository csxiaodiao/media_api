class MediaController < ApplicationController
  def search
    @q = Medium.ransack(params[:q])
    @medium = Kaminari.paginate_array(@q.result, total_count: @q.result.count).page(params[:page]).per(50)
    
    data = {
      item: @medium.page,
      total_count: @medium.total_count,
      total_pages: @medium.total_pages,
      current_page: @medium.current_page,
      prev_page: @medium.prev_page,
      next_page: @medium.next_page,
    }
    
    
    render json: data
  end
end
