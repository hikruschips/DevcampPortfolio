class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolio_url(@portfolio_item), notice: "Portfolio Item was successfully created." }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # private
    # Use callbacks to share common setup or constraints between actions.
    # def set_blog
    #   @blog = Blog.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    # def portfolio_item_params
    #   params.require(:portfolio).permit(:title, :subtitle, :body)
    # end

end
