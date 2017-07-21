class RightsHoldersController < ApplicationController
  before_action :set_rights_holder, only: [:show, :edit, :update, :destroy]

  # GET /rights_holders
  # GET /rights_holders.json
  def index
    @rights_holders = RightsHolder.all
  end

  # GET /rights_holders/1
  # GET /rights_holders/1.json
  def show
  end

  # GET /rights_holders/new
  def new
    @rights_holder = RightsHolder.new
  end

  # GET /rights_holders/1/edit
  def edit
  end

  # POST /rights_holders
  # POST /rights_holders.json
  def create
    @rights_holder = RightsHolder.new(rights_holder_params)

    respond_to do |format|
      if @rights_holder.save
        format.html { redirect_to @rights_holder, notice: 'Rights holder was successfully created.' }
        format.json { render :show, status: :created, location: @rights_holder }
      else
        format.html { render :new }
        format.json { render json: @rights_holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rights_holders/1
  # PATCH/PUT /rights_holders/1.json
  def update
    respond_to do |format|
      if @rights_holder.update(rights_holder_params)
        format.html { redirect_to @rights_holder, notice: 'Rights holder was successfully updated.' }
        format.json { render :show, status: :ok, location: @rights_holder }
      else
        format.html { render :edit }
        format.json { render json: @rights_holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rights_holders/1
  # DELETE /rights_holders/1.json
  def destroy
    @rights_holder.destroy
    respond_to do |format|
      format.html { redirect_to rights_holders_url, notice: 'Rights holder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rights_holder
      @rights_holder = RightsHolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rights_holder_params
      params.require(:rights_holder).permit(:name, :website, :email, :stored_product_id)
    end
end
