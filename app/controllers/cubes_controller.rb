class CubesController < ApplicationController
  before_action :set_cube, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /cubes
  # GET /cubes.json
  def index
    @cubes = Cube.all
    # @cubes = Cube.all.order("created_at desc")
  end

  # GET /cubes/1
  # GET /cubes/1.json
  def show
  end

  # GET /cubes/new
  def new
    @cube = Cube.new
    # @cube = current_user.cubes.build
  end

  # GET /cubes/1/edit
  def edit
  end

  # POST /cubes
  # POST /cubes.json
  def create
    @cube = Cube.new(cube_params)
    # @cube = current_user.cubes.build(cube_params)

    respond_to do |format|
      if @cube.save
        format.html { redirect_to @cube, notice: 'Cube was successfully created.' }
        format.json { render :show, status: :created, location: @cube }
      else
        format.html { render :new }
        format.json { render json: @cube.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cubes/1
  # PATCH/PUT /cubes/1.json
  def update
    respond_to do |format|
      if @cube.update(cube_params)
        format.html { redirect_to @cube, notice: 'Cube was successfully updated.' }
        format.json { render :show, status: :ok, location: @cube }
      else
        format.html { render :edit }
        format.json { render json: @cube.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cubes/1
  # DELETE /cubes/1.json
  def destroy
    @cube.destroy
    respond_to do |format|
      format.html { redirect_to cubes_url, notice: 'Cube was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cube
      @cube = Cube.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cube_params
      params.require(:cube).permit(:brand, :model, :description, :condition, :finish, :title, :price, :image)
    end
end
