class SubTagsController < ApplicationController
  before_action :set_sub_tag, only: [:show, :edit, :update, :destroy]

  # GET /sub_tags
  # GET /sub_tags.json
  def index
    @sub_tags = SubTag.all
  end

  # GET /sub_tags/1
  # GET /sub_tags/1.json
  def show
  end

  # GET /sub_tags/new
  def new
    @sub_tag = SubTag.new
  end

  # GET /sub_tags/1/edit
  def edit
  end

  # POST /sub_tags
  # POST /sub_tags.json
  def create
    @sub_tag = SubTag.new(sub_tag_params)

    respond_to do |format|
      if @sub_tag.save
        format.html { redirect_to @sub_tag, notice: 'Sub tag was successfully created.' }
        format.json { render :show, status: :created, location: @sub_tag }
      else
        format.html { render :new }
        format.json { render json: @sub_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_tags/1
  # PATCH/PUT /sub_tags/1.json
  def update
    respond_to do |format|
      if @sub_tag.update(sub_tag_params)
        format.html { redirect_to @sub_tag, notice: 'Sub tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_tag }
      else
        format.html { render :edit }
        format.json { render json: @sub_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_tags/1
  # DELETE /sub_tags/1.json
  def destroy
    @sub_tag.destroy
    respond_to do |format|
      format.html { redirect_to sub_tags_url, notice: 'Sub tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_tag
      @sub_tag = SubTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_tag_params
      params.require(:sub_tag).permit(:name, :tag_id)
    end
end
