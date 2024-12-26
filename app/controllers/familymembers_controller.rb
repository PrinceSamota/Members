class FamilymembersController < ApplicationController
  before_action :set_familymember, only: %i[ show edit update destroy ]
  before_action :set_member
  # GET /familymembers or /familymembers.json
  def index
    @familymembers = @member.familymember
  end

  def all
    @familymembers = Familymember.includes(:member).all
  end

  # GET /familymembers/1 or /familymembers/1.json
  def show
  end

  # GET /familymembers/new
  def new
    @family_leader = Member.find(params[:member_id]) # Family leader fetch
    @family_member = @family_leader.familymember.new
  end

  # GET /familymembers/1/edit
  def edit
  end

  # POST /familymembers or /familymembers.json
  def create
    @member = Member.find_by(id: params[:member_id])
    Rails.logger.debug "Member: #{@member.inspect}"
  
    @familymember = @member&.familymember&.new(familymember_params)
    Rails.logger.debug "FamilyMember: #{@familymember.inspect}"
  
    if @familymember&.save
      redirect_to member_familymembers_path(@member), notice: "Family member was successfully created."
    else
      Rails.logger.error "Errors: #{@familymember.errors.full_messages}" if @familymember
      flash.now[:alert] = "Unable to create family member."
      render :new, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /familymembers/1 or /familymembers/1.json
  def update
    respond_to do |format|
      if @familymember.update(familymember_params)
        format.html { redirect_to @familymember, notice: "Familymember was successfully updated." }
        format.json { render :show, status: :ok, location: @familymember }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @familymember.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familymembers/1 or /familymembers/1.json
  def destroy
    @familymember.destroy!

    respond_to do |format|
      format.html { redirect_to familymembers_path, status: :see_other, notice: "Familymember was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_familymember
      @familymember = Familymember.find(params.expect(:id))
    end

    def set_member
      @member = Member.find(params[:member_id])
    end
    # Only allow a list of trusted parameters through.
    def familymember_params
      params.expect(familymember: [:name, :permanent_address, :present_address, :polling_station, :permanent_address, :present_address, :polling_station, :relation, :mobile_number, :election_number, :house_number])
    end
end
