class FlatmateGroupsController < ApplicationController
  # GET /flatmate_groups
  # GET /flatmate_groups.json
  def index
    @flatmate_groups = FlatmateGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flatmate_groups }
    end
  end

  # GET /flatmate_groups/1
  # GET /flatmate_groups/1.json
  def show
    @flatmate_group = FlatmateGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flatmate_group }
    end
  end

  # GET /flatmate_groups/new
  # GET /flatmate_groups/new.json
  def new
    @flatmate_group = FlatmateGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flatmate_group }
    end
  end

  # GET /flatmate_groups/1/edit
  def edit
    @flatmate_group = FlatmateGroup.find(params[:id])
  end

  # POST /flatmate_groups
  # POST /flatmate_groups.json
  def create
    @flatmates = []
    for member in params[:updated_group_members]
      @flatmates << Flatmate.where(name: member).first
    end

    @flatmate_group = @flatmates[0].flatmate_groups.build(params[:flatmate_group])

    for flatmate in @flatmates
      flatmate.flatmate_groups << @flatmate_group
    end

    respond_to do |format|
      if @flatmates[0].save
        format.html { redirect_to @flatmate_group, notice: 'Flatmate group was successfully created.' }
        format.json { render json: @flatmate_group, status: :created, location: @flatmate_group }
      else
        format.html { render action: "new" }
        format.json { render json: @flatmate_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flatmate_groups/1
  # PUT /flatmate_groups/1.json
  def update
    @flatmate_group = FlatmateGroup.find(params[:id])

    @flatmate_group.flatmates.clear
    params[:flatmate_group][:is_active] = params[:flatmate_group][:is_active] == "1"
    new_members = params[:updated_group_members]
    for member in new_members
      @flatmate_group.flatmates << Flatmate.where(name: member)
    end

    respond_to do |format|
      if @flatmate_group.update_attributes(params[:flatmate_group])
        format.html { redirect_to @flatmate_group, notice: 'Flatmate group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flatmate_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flatmate_groups/1
  # DELETE /flatmate_groups/1.json
  def destroy
    @flatmate_group = FlatmateGroup.find(params[:id])

    respond_to do |format|
      if @flatmate_group.destroy
        format.html { redirect_to flatmate_groups_url, notice: 'Flatmate group was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { render action: "show" }
        format.json { render json: @flatmate_group.errors, status: :unprocessable_entity }
      end
    end
  end

end
