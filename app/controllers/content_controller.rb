class ContentController < ApplicationController
  skip_before_filter :require_login
  def about
    @page_name = params[:page_name]
    render @page_name if @page_name
  rescue ActionView::MissingTemplate
    raise ActionController::RoutingError.new('Not Found')
  end
end
