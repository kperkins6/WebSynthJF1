class SynthTagsController < ApplicationController
  before_action :set_synth_tag, only: [:show, :edit, :update, :destroy]

  # GET /synth_tags
  # GET /synth_tags.json
  def index
    @synth_tags = SynthTag.all
  end

  # GET /synth_tags/1
  # GET /synth_tags/1.json
  def show
  end

  # GET /synth_tags/new
  def new
    @synth_tag = SynthTag.new
  end

  # GET /synth_tags/1/edit
  def edit
  end

  # POST /synth_tags
  # POST /synth_tags.json
  def create
    @synth_tag = SynthTag.new(synth_tag_params)

    respond_to do |format|
      if @synth_tag.save
        format.html { redirect_to @synth_tag, notice: 'Synth tag was successfully created.' }
        format.json { render :show, status: :created, location: @synth_tag }
      else
        format.html { render :new }
        format.json { render json: @synth_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /synth_tags/1
  # PATCH/PUT /synth_tags/1.json
  def update
    respond_to do |format|
      if @synth_tag.update(synth_tag_params)
        format.html { redirect_to @synth_tag, notice: 'Synth tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @synth_tag }
      else
        format.html { render :edit }
        format.json { render json: @synth_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /synth_tags/1
  # DELETE /synth_tags/1.json
  def destroy
    @synth_tag.destroy
    respond_to do |format|
      format.html { redirect_to synth_tags_url, notice: 'Synth tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synth_tag
      @synth_tag = SynthTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def synth_tag_params
      params.require(:synth_tag).permit(:str, :synth_id)
    end
end
