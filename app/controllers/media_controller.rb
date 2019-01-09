class MediaController < ApplicationController
  def search
    @q = Medium.ransack(params[:q])
    @medium = Kaminari.paginate_array(@q.result, total_count: @q.result.count).page(params[:page]).per(50)
    render json:{
      item: render_to_string(partial: 'tr', locals: {items: @medium.page}),
      total_count: @medium.total_count,
      total_pages: @medium.total_pages,
      current_page: @medium.current_page,
      prev_page: @medium.prev_page,
      next_page: @medium.next_page 
    }
  end
end
