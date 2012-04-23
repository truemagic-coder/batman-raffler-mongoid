class EntriesController < ApplicationController

  respond_to :json

  def index
    respond_with Entry.all
  end

  def show
    respond_with Entry.find(params[:id])
  end

  def create
    respond_with Entry.create(params[:entry])
  end

  def update
    entry = Entry.find(params[:id])
    respond_with entry.update_attributes(params[:entry])
  end

  def destroy
    entry = Entry.find(params[:id])
    respond_with entry.destroy
  end
end