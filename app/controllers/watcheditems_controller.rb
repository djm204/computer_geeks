class WatcheditemsController < ApplicationController
  before_action :set_watcheditem, only: [:show, :edit, :update, :destroy]

  # GET /watcheditems
  # GET /watcheditems.json
  def index
    @watcheditems = Watcheditem.all
  end

  # GET /watcheditems/1
  # GET /watcheditems/1.json
  def show
  end

  # GET /watcheditems/new
  def new
    @watcheditem = Watcheditem.new
  end

  # GET /watcheditems/1/edit
  def edit
  end

  # POST /watcheditems
  # POST /watcheditems.json
  def create
    @watcheditem = Watcheditem.new(watcheditem_params)

    respond_to do |format|
      if @watcheditem.save
        format.html { redirect_to @watcheditem, notice: 'Watcheditem was successfully created.' }
        format.json { render action: 'show', status: :created, location: @watcheditem }
      else
        format.html { render action: 'new' }
        format.json { render json: @watcheditem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /watcheditems/1
  # PATCH/PUT /watcheditems/1.json
  def update
    respond_to do |format|
      if @watcheditem.update(watcheditem_params)
        format.html { redirect_to @watcheditem, notice: 'Watcheditem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @watcheditem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watcheditems/1
  # DELETE /watcheditems/1.json
  def destroy
    @watcheditem.destroy
    respond_to do |format|
      format.html { redirect_to watcheditems_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watcheditem
      @watcheditem = Watcheditem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watcheditem_params
      params[:watcheditem]
    end
end
