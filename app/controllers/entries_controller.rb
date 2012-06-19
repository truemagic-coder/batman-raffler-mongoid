class EntriesController < ApplicationController

  respond_to :json

  def index
    respond_with Entry.all
  end

  def show
    respond_with Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(params[:entry])
    respond_to do |format|
      if @entry.save
        format.json { render :json => @entry }
      else
        format.json { render :json => @entry.errors, :status => :unprocessable_entity}
      end
    end
  end

  def update
    @entry = Entry.find(params[:id])
    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.json { render :json => @entry }
      else
        format.json { render :json => @entry.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    entry = Entry.find(params[:id])
    respond_with entry.destroy
  end
end