class SynthPresetUsersController < ApplicationController
  before_action :set_synth_preset_user, only: [:show, :edit, :update, :destroy]

  # GET /synth_preset_users
  # GET /synth_preset_users.json
  def index
    @synth_preset_users = SynthPresetUser.all
  end

  # GET /synth_preset_users/1
  # GET /synth_preset_users/1.json
  def show
  end

  # GET /synth_preset_users/new
  def new
    @synth_preset_user = SynthPresetUser.new
  end

  # GET /synth_preset_users/1/edit
  def edit
  end

  # POST /synth_preset_users
  # POST /synth_preset_users.json
  def create
    @synth_preset_user = SynthPresetUser.new(synth_preset_user_params)

    respond_to do |format|
      if @synth_preset_user.save
        format.html { redirect_to @synth_preset_user, notice: 'Synth preset user was successfully created.' }
        format.json { render :show, status: :created, location: @synth_preset_user }
      else
        format.html { render :new }
        format.json { render json: @synth_preset_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /synth_preset_users/1
  # PATCH/PUT /synth_preset_users/1.json
  def update
    respond_to do |format|
      if @synth_preset_user.update(synth_preset_user_params)
        format.html { redirect_to @synth_preset_user, notice: 'Synth preset user was successfully updated.' }
        format.json { render :show, status: :ok, location: @synth_preset_user }
      else
        format.html { render :edit }
        format.json { render json: @synth_preset_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /synth_preset_users/1
  # DELETE /synth_preset_users/1.json
  def destroy
    @synth_preset_user.destroy
    respond_to do |format|
      format.html { redirect_to synth_preset_users_url, notice: 'Synth preset user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synth_preset_user
      @synth_preset_user = SynthPresetUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def synth_preset_user_params
      params.require(:synth_preset_user).permit(:preset_id, :user_id)
    end
end
