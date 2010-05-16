class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    params[:request][:title] = params[:request][:title].titleize
    @request = Request.new(params[:request])
    if @request.save
      flash[:notice] = "Successfully created request."
      redirect_to @request
    else
      render :action => 'new'
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    params[:request][:title] = params[:request][:title].titleize
    if @request.update_attributes(params[:request])
      flash[:notice] = "Successfully updated request."
      redirect_to @request
    else
      render :action => 'edit'
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash[:notice] = "Successfully destroyed request."
    redirect_to requests_url
  end

  def convert
    @request = Request.find(params[:id])
  end

  def save_as_entry
    debugger
    @entry = Entry.new(params[:entry])
    if @entry.save
      @request = Request.find(params[:id])
      @request.destroy
      flash[:notice] = "Successfully created entry."
      redirect_to @entry
    else
      render :action => 'convert'
    end
  end
end

