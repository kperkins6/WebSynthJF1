class SynthPresetsController < ApplicationController
  before_action :set_synth_preset, only: [:show, :edit, :update, :destroy]

  # GET /synth_presets
  # GET /synth_presets.json
  def index
    @synth_presets = SynthPreset.all
  end

  # GET /synth_presets/1
  # GET /synth_presets/1.json
  def show
  end

  # GET /synth_presets/new
  def new
    @synth_preset = SynthPreset.new
  end

  # GET /synth_presets/1/edit
  def edit
  end

  # POST /synth_presets
  # POST /synth_presets.json
  def create
    @synth_preset = SynthPreset.new(synth_preset_params)

    respond_to do |format|
      if @synth_preset.save
        format.html { redirect_to @synth_preset, notice: 'Synth preset was successfully created.' }
        format.json { render :show, status: :created, location: @synth_preset }
      else
        format.html { render :new }
        format.json { render json: @synth_preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /synth_presets/1
  # PATCH/PUT /synth_presets/1.json
  def update
    respond_to do |format|
      if @synth_preset.update(synth_preset_params)
        format.html { redirect_to @synth_preset, notice: 'Synth preset was successfully updated.' }
        format.json { render :show, status: :ok, location: @synth_preset }
      else
        format.html { render :edit }
        format.json { render json: @synth_preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /synth_presets/1
  # DELETE /synth_presets/1.json
  def destroy
    @synth_preset.destroy
    respond_to do |format|
      format.html { redirect_to synth_presets_url, notice: 'Synth preset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synth_preset
      @synth_preset = SynthPreset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def synth_preset_params
      params.require(:synth_preset).permit(:filename, :private, :user_id)
    end
end
