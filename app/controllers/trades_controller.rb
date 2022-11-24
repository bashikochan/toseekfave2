class TradesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_collection

  def index
    @trade = Trade.all.order('created_at DESC')
    @trades 
    #@collection = Collection.find_by(id: params[:id])
  end

  def new
    #@collection = Collection.find_by(id: params[:id])
    @trade = Trade.new
  end

  def create
    #@collection = Collection.find_by(id: params[:id])
    @trade = Trade.new(trade_params)
    if @trade.save
      redirect_to "/collections/trades"  
    else
      render :new
    end
  end

  def show
    @trade = Trade.find(params[:id])
    @user = @trade.user
  end

  def edit
    trade = Trade.find(params[:id])
    unless trade.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @trade = Trade.find(params[:id])
    if trade.update(trade_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
    redirect_to "/collections/#{@trade.collection.id}"
  end

  private

  def find_collection
    @collection = Collection.find_by(id: params[:collection_id])
  end

  def trade_params
    params.require(:trade).permit(:content, :favemember_id, :type_id, :heterogeneous).merge(collection_id: params[:collection_id], user_id: current_user.id)
  end


end
