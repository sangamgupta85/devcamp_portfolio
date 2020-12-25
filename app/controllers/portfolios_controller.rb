class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_url, notice: 'portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
