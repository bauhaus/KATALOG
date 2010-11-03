class ThingListsController < ApplicationController
  
  # layout nil, :only => [:show]
  
  # GET /thing_lists
  # GET /thing_lists.xml
  def index
    @thing_lists = ThingList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thing_lists }
    end
  end

  # GET /thing_lists/1
  # GET /thing_lists/1.xml
  def show
    @thing_list = ThingList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thing_list }
    end
  end

  # GET /thing_lists/new
  # GET /thing_lists/new.xml
  def new
    @thing_list = ThingList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thing_list }
    end
  end

  # GET /thing_lists/1/edit
  def edit
    @thing_list = ThingList.find(params[:id])
  end

  # POST /thing_lists
  # POST /thing_lists.xml
  def create
    @thing_list = ThingList.new(params[:thing_list])

    respond_to do |format|
      if @thing_list.save
        format.html { redirect_to(@thing_list, :notice => 'Thing list was successfully created.') }
        format.xml  { render :xml => @thing_list, :status => :created, :location => @thing_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thing_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thing_lists/1
  # PUT /thing_lists/1.xml
  def update
    @thing_list = ThingList.find(params[:id])

    respond_to do |format|
      if @thing_list.update_attributes(params[:thing_list])
        format.html { redirect_to(@thing_list, :notice => 'Thing list was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thing_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thing_lists/1
  # DELETE /thing_lists/1.xml
  def destroy
    @thing_list = ThingList.find(params[:id])
    @thing_list.destroy

    respond_to do |format|
      format.html { redirect_to(thing_lists_url) }
      format.xml  { head :ok }
    end
  end
end
