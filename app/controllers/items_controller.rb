class ItemsController < ApplicationController

  #layout 'admin'
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index         
    @items = Item.all.order(":name ASC")
  end

  def list
   @items = Item.all.order(":name ASC")
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item=Item.find(params[:id])
  end


  # GET /items/1/edit
  def edit
     @item=Item.find(params[:id])
  end

   # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        #if save fails, it will redirect to edit template
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /items/new
  def new
    @item = Item.new            #used in form_for in new.html.erb
                                #can also be used to put in default values
  end


  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)   #or params[:items]

    respond_to do |format|
      if @item.save           #if object is saved successfully, eg validations pass
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else                    
        #if object is not saved successfully, redirect to new action
        format.html { render action: 'new' }    #all filled fields will be prepopulated
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

 

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:department_id, :name, :isle, :quantity)
    end
end
