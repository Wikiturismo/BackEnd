class ImgtownsController < ApplicationController
  before_action :set_imgtown, only: [:show, :edit, :update, :destroy]

  # GET /imgtowns
  # GET /imgtowns.json
  def index
    @imgtowns = Imgtown.all
  end

  # GET /imgtowns/1
  # GET /imgtowns/1.json
  def show
  end

  # GET /imgtowns/new
  def new
    @imgtown = Imgtown.new
  end

  # GET /imgtowns/1/edit
  def edit
  end

  # POST /imgtowns
  # POST /imgtowns.json
  def create
    @imgtown = Imgtown.new(imgtown_params)

    respond_to do |format|
      if @imgtown.save
        format.html { redirect_to @imgtown, notice: 'Imgtown was successfully created.' }
        format.json { render :show, status: :created, location: @imgtown }
      else
        format.html { render :new }
        format.json { render json: @imgtown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imgtowns/1
  # PATCH/PUT /imgtowns/1.json
  def update
    respond_to do |format|
      if @imgtown.update(imgtown_params)
        format.html { redirect_to @imgtown, notice: 'Imgtown was successfully updated.' }
        format.json { render :show, status: :ok, location: @imgtown }
      else
        format.html { render :edit }
        format.json { render json: @imgtown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imgtowns/1
  # DELETE /imgtowns/1.json
  def destroy
    @imgtown.destroy
    respond_to do |format|
      format.html { redirect_to imgtowns_url, notice: 'Imgtown was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imgtown
      @imgtown = Imgtown.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imgtown_params
      params.require(:imgtown).permit(:name, :description, :image)
    end
end
