class Master::SpecsController < ApplicationController
  # GET /master/specs
  # GET /master/specs.xml
  def index
    @master_specs = Master::Spec.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @master_specs }
    end
  end

  # GET /master/specs/1
  # GET /master/specs/1.xml
  def show
    @master_spec = Master::Spec.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @master_spec }
    end
  end

  # GET /master/specs/new
  # GET /master/specs/new.xml
  def new
    @master_spec = Master::Spec.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @master_spec }
    end
  end

  # GET /master/specs/1/edit
  def edit
    @master_spec = Master::Spec.find(params[:id])
  end

  # POST /master/specs
  # POST /master/specs.xml
  def create
    @master_spec = Master::Spec.new(params[:master_spec])

    respond_to do |format|
      if @master_spec.save
        format.html { redirect_to(@master_spec, :notice => 'Spec was successfully created.') }
        format.xml  { render :xml => @master_spec, :status => :created, :location => @master_spec }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @master_spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /master/specs/1
  # PUT /master/specs/1.xml
  def update
    @master_spec = Master::Spec.find(params[:id])

    respond_to do |format|
      if @master_spec.update_attributes(params[:master_spec])
        format.html { redirect_to(@master_spec, :notice => 'Spec was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @master_spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /master/specs/1
  # DELETE /master/specs/1.xml
  def destroy
    @master_spec = Master::Spec.find(params[:id])
    @master_spec.destroy

    respond_to do |format|
      format.html { redirect_to(master_specs_url) }
      format.xml  { head :ok }
    end
  end
end
