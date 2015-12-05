class SequencerPresetsController < ApplicationController
  before_action :set_sequencer_preset, only: [:show, :edit, :update, :destroy]

  # GET /sequencer_presets
  # GET /sequencer_presets.json
  def index
    @sequencer_presets = SequencerPreset.all
  end

  # GET /sequencer_presets/1
  # GET /sequencer_presets/1.json
  def show
  end

  # GET /sequencer_presets/new
  def new
    @sequencer_preset = SequencerPreset.new
  end

  # GET /sequencer_presets/1/edit
  def edit
  end

  # POST /sequencer_presets
  # POST /sequencer_presets.json
  def create
    @sequencer_preset = SequencerPreset.new(sequencer_preset_params)

    respond_to do |format|
      if @sequencer_preset.save
        format.html { redirect_to @sequencer_preset, notice: 'Sequencer preset was successfully created.' }
        format.json { render :show, status: :created, location: @sequencer_preset }
      else
        format.html { render :new }
        format.json { render json: @sequencer_preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequencer_presets/1
  # PATCH/PUT /sequencer_presets/1.json
  def update
    respond_to do |format|
      if @sequencer_preset.update(sequencer_preset_params)
        format.html { redirect_to @sequencer_preset, notice: 'Sequencer preset was successfully updated.' }
        format.json { render :show, status: :ok, location: @sequencer_preset }
      else
        format.html { render :edit }
        format.json { render json: @sequencer_preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequencer_presets/1
  # DELETE /sequencer_presets/1.json
  def destroy
    @sequencer_preset.destroy
    respond_to do |format|
      format.html { redirect_to sequencer_presets_url, notice: 'Sequencer preset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequencer_preset
      @sequencer_preset = SequencerPreset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sequencer_preset_params
      params.require(:sequencer_preset).permit(:filename, :private, :user_id)
    end
end
