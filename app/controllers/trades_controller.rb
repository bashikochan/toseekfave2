class TradesController < ApplicationController

  def index
    @collections = Collection.all
  end


end
