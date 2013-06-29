class FlatmatesController < ApplicationController
  # GET /flatmates
  # GET /flatmates.json
  def index
    @flatmates = Flatmate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flatmates }
    end
  end

  # GET /flatmates/1
  # GET /flatmates/1.json
  def show
    @flatmate = Flatmate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flatmate }
    end
  end

  # GET /flatmates/new
  # GET /flatmates/new.json
  def new
    @flatmate = Flatmate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flatmate }
    end
  end

  # GET /flatmates/1/edit
  def edit
    @flatmate = Flatmate.find(params[:id])
  end

  # POST /flatmates
  # POST /flatmates.json
  def create
    @flatmate = Flatmate.new(params[:flatmate])
#    @flatmate.flatmate_groups << FlatmateGroup.new(:name => @flatmate.name, :shortname => @flatmate.name, :is_active => true, :is_personal => true)

    respond_to do |format|
      if @flatmate.save
        format.html { redirect_to @flatmate, notice: 'Flatmate was successfully created.' }
        format.json { render json: @flatmate, status: :created, location: @flatmate }
      else
        format.html { render action: "new" }
        format.json { render json: @flatmate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flatmates/1
  # PUT /flatmates/1.json
  def update
    @flatmate = Flatmate.find(params[:id])
    @group = FlatmateGroup.where(name: @flatmate.name).first

    respond_to do |format|
      if @flatmate.update_attributes(params[:flatmate])
        @group.name = @flatmate.name
        @group.shortname = @flatmate.name[0,1]
        @group.save
        format.html { redirect_to @flatmate, notice: 'Flatmate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flatmate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flatmates/1
  # DELETE /flatmates/1.json
  def destroy
    @flatmate = Flatmate.find(params[:id])
    #pg = @flatmate.personal_group
    respond_to do |format|
      if @flatmate.destroy
        #pg.is_active = false unless pg.nil?
        #pg.save
        format.html { redirect_to flatmates_url, notice: 'Flatmate was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { render action: "show" }
        format.json { render json: @flatmate.errors, status: :unprocessable_entity }
      end
    end
  end
end
