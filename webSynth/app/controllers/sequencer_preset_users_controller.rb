class SequencerPresetUsersController < ApplicationController
  before_action :set_sequencer_preset_user, only: [:show, :edit, :update, :destroy]

  # GET /sequencer_preset_users
  # GET /sequencer_preset_users.json
  def index
    @sequencer_preset_users = SequencerPresetUser.all
  end

  # GET /sequencer_preset_users/1
  # GET /sequencer_preset_users/1.json
  def show
  end

  # GET /sequencer_preset_users/new
  def new
    @sequencer_preset_user = SequencerPresetUser.new
  end

  # GET /sequencer_preset_users/1/edit
  def edit
  end

  # POST /sequencer_preset_users
  # POST /sequencer_preset_users.json
  def create
    @sequencer_preset_user = SequencerPresetUser.new(sequencer_preset_user_params)

    respond_to do |format|
      if @sequencer_preset_user.save
        format.html { redirect_to @sequencer_preset_user, notice: 'Sequencer preset user was successfully created.' }
        format.json { render :show, status: :created, location: @sequencer_preset_user }
      else
        format.html { render :new }
        format.json { render json: @sequencer_preset_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequencer_preset_users/1
  # PATCH/PUT /sequencer_preset_users/1.json
  def update
    respond_to do |format|
      if @sequencer_preset_user.update(sequencer_preset_user_params)
        format.html { redirect_to @sequencer_preset_user, notice: 'Sequencer preset user was successfully updated.' }
        format.json { render :show, status: :ok, location: @sequencer_preset_user }
      else
        format.html { render :edit }
        format.json { render json: @sequencer_preset_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequencer_preset_users/1
  # DELETE /sequencer_preset_users/1.json
  def destroy
    @sequencer_preset_user.destroy
    respond_to do |format|
      format.html { redirect_to sequencer_preset_users_url, notice: 'Sequencer preset user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequencer_preset_user
      @sequencer_preset_user = SequencerPresetUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sequencer_preset_user_params
      params.require(:sequencer_preset_user).permit(:preset_id, :user_id)
    end
end
