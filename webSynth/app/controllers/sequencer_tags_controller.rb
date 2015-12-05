class SequencerTagsController < ApplicationController
  before_action :set_sequencer_tag, only: [:show, :edit, :update, :destroy]

  # GET /sequencer_tags
  # GET /sequencer_tags.json
  def index
    @sequencer_tags = SequencerTag.all
  end

  # GET /sequencer_tags/1
  # GET /sequencer_tags/1.json
  def show
  end

  # GET /sequencer_tags/new
  def new
    @sequencer_tag = SequencerTag.new
  end

  # GET /sequencer_tags/1/edit
  def edit
  end

  # POST /sequencer_tags
  # POST /sequencer_tags.json
  def create
    @sequencer_tag = SequencerTag.new(sequencer_tag_params)

    respond_to do |format|
      if @sequencer_tag.save
        format.html { redirect_to @sequencer_tag, notice: 'Sequencer tag was successfully created.' }
        format.json { render :show, status: :created, location: @sequencer_tag }
      else
        format.html { render :new }
        format.json { render json: @sequencer_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequencer_tags/1
  # PATCH/PUT /sequencer_tags/1.json
  def update
    respond_to do |format|
      if @sequencer_tag.update(sequencer_tag_params)
        format.html { redirect_to @sequencer_tag, notice: 'Sequencer tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @sequencer_tag }
      else
        format.html { render :edit }
        format.json { render json: @sequencer_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequencer_tags/1
  # DELETE /sequencer_tags/1.json
  def destroy
    @sequencer_tag.destroy
    respond_to do |format|
      format.html { redirect_to sequencer_tags_url, notice: 'Sequencer tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequencer_tag
      @sequencer_tag = SequencerTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sequencer_tag_params
      params.require(:sequencer_tag).permit(:str, :sequencer_id)
    end
end
