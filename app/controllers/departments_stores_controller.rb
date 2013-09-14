class DepartmentsStoresController < ApplicationController
  before_action :set_departments_store, only: [:show, :edit, :update, :destroy]

  # GET /departments_stores
  # GET /departments_stores.json
  def index
    @departments_stores = DepartmentsStore.all
  end

  # GET /departments_stores/1
  # GET /departments_stores/1.json
  def show
  end

  # GET /departments_stores/new
  def new
    @departments_store = DepartmentsStore.new
  end

  # GET /departments_stores/1/edit
  def edit
  end

  # POST /departments_stores
  # POST /departments_stores.json
  def create
    @departments_store = DepartmentsStore.new(departments_store_params)

    respond_to do |format|
      if @departments_store.save
        format.html { redirect_to @departments_store, notice: 'Departments store was successfully created.' }
        format.json { render action: 'show', status: :created, location: @departments_store }
      else
        format.html { render action: 'new' }
        format.json { render json: @departments_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments_stores/1
  # PATCH/PUT /departments_stores/1.json
  def update
    respond_to do |format|
      if @departments_store.update(departments_store_params)
        format.html { redirect_to @departments_store, notice: 'Departments store was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @departments_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments_stores/1
  # DELETE /departments_stores/1.json
  def destroy
    @departments_store.destroy
    respond_to do |format|
      format.html { redirect_to departments_stores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departments_store
      @departments_store = DepartmentsStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departments_store_params
      params.require(:departments_store).permit(:department_id, :store_id)
    end
end
