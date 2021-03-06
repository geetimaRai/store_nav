class StoresController < ApplicationController

  #layout 'admin'
before_filter :signed_in_user
  
  #before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json

  def index
     @stores = Store.order("stores.name ASC")
  end

  def list
    @stores = Store.order("stores.name ASC")
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store=Store.find(params[:id])
  end

 
  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
    @store=Store.find(params[:id])
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store }
      else
        format.html { render action: 'new' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    #Find object using form parameters
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :location, :map)
    end
end
