class DepartmentsController < ApplicationController
  
  #layout 'admin'
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  
  before_filter :find_store, only: [:index]

  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all.order("name ASC").where(:store_id => @store.id)
  end

  def list      #NOT WORKING
    @departments = Department.all.order(":name ASC")
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department=Department.find(params[:id])
  end

  # GET /departments/new
  def new
   
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
     @department=Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render action: 'show', status: :created, location: @department }
      else
        format.html { render action: 'new' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name)
    end

    def find_store
      if(params[:store_id])
        @store=Store.find_by_id(params[:store_id])
      end
    end
end
