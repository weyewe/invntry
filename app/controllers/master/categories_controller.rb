class Master::CategoriesController < ApplicationController
  # GET /master/categories
  # GET /master/categories.xml
  def index
    @master_categories = Master::Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @master_categories }
    end
  end

  # GET /master/categories/1
  # GET /master/categories/1.xml
  def show
    @master_category = Master::Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @master_category }
    end
  end

  # GET /master/categories/new
  # GET /master/categories/new.xml
  def new
    @master_category = Master::Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @master_category }
    end
  end

  # GET /master/categories/1/edit
  def edit
    @master_category = Master::Category.find(params[:id])
  end

  # POST /master/categories
  # POST /master/categories.xml
  def create
    @master_category = Master::Category.new(params[:master_category])

    respond_to do |format|
      if @master_category.save
        format.html { redirect_to(@master_category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @master_category, :status => :created, :location => @master_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @master_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /master/categories/1
  # PUT /master/categories/1.xml
  def update
    @master_category = Master::Category.find(params[:id])

    respond_to do |format|
      if @master_category.update_attributes(params[:master_category])
        format.html { redirect_to(@master_category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @master_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /master/categories/1
  # DELETE /master/categories/1.xml
  def destroy
    @master_category = Master::Category.find(params[:id])
    @master_category.destroy

    respond_to do |format|
      format.html { redirect_to(master_categories_url) }
      format.xml  { head :ok }
    end
  end
end
