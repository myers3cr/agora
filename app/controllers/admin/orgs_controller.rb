class Admin::OrgsController < ApplicationController
  # GET /orgs
  # GET /orgs.json
  def index
    @orgs = Org.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orgs }
    end
  end

  # GET /orgs/1
  # GET /orgs/1.json
  def show
    @org = Org.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @org }
    end
  end

  # GET /orgs/new
  # GET /orgs/new.json
  def new
    @org = Org.new
    # set defaults for org_type and currency
    @org.org_type_id = OrgType.find_by_name('Supplier').id
    @org.currency_id = Currency.find_by_description('Euro').id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @org }
    end
  end

  # GET /orgs/1/edit
  def edit
    @org = Org.find(params[:id])
  end

  # POST /orgs
  # POST /orgs.json
  def create
    @org = Org.new(params[:org])

    respond_to do |format|
      if @org.save
        format.html { redirect_to admin_orgs_path, notice: "Org #{@org.name} was successfully created." }
        format.json { render json: @org, status: :created, location: @org }
      else
        format.html { render action: "new" }
        format.json { render json: @org.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orgs/1
  # PUT /orgs/1.json
  def update
    @org = Org.find(params[:id])

    respond_to do |format|
      if @org.update_attributes(params[:org])
        format.html { redirect_to admin_orgs_path, notice: "Org #{@org.name} was successfully updated." }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @org.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgs/1
  # DELETE /orgs/1.json
  def destroy
    @org = Org.find(params[:id])
    @org.destroy

    respond_to do |format|
      format.html { redirect_to admin_orgs_url }
      format.json { head :ok }
    end
  end
end
