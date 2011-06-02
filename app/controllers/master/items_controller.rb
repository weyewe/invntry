class Master::ItemsController < ApplicationController
  # GET /master/items
  # GET /master/items.xml
  def index
    @master_items = Master::Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @master_items }
    end
  end

  # GET /master/items/1
  # GET /master/items/1.xml
  def show
    @master_item = Master::Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @master_item }
    end
  end

  # GET /master/items/new
  # GET /master/items/new.xml
  def new
    @master_item = Master::Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @master_item }
    end
  end

  # GET /master/items/1/edit
  def edit
    @master_item = Master::Item.find(params[:id])
  end

  # POST /master/items
  # POST /master/items.xml
  def create
    @master_item = Master::Item.new(params[:master_item])

    respond_to do |format|
      if @master_item.save
        format.html { redirect_to(@master_item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @master_item, :status => :created, :location => @master_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @master_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /master/items/1
  # PUT /master/items/1.xml
  def update
    @master_item = Master::Item.find(params[:id])

    respond_to do |format|
      if @master_item.update_attributes(params[:master_item])
        format.html { redirect_to(@master_item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @master_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /master/items/1
  # DELETE /master/items/1.xml
  def destroy
    @master_item = Master::Item.find(params[:id])
    @master_item.destroy

    respond_to do |format|
      format.html { redirect_to(master_items_url) }
      format.xml  { head :ok }
    end
  end
end
