class VictimsController < ApplicationController

  def new
    @victim = Victim.new
  end

  def create
    @victim = Victim.new(victim_params)

    respond_to do |f|
      if @victim.save
        VictimMailer.cursed_email(@victim).deliver

        redirect_to "index/success"
        format.html { redirect_to(@victim, notice: 'Victim was successfully cursed.') }
        format.json { render json: @victim, status: :created, location: @victim }
      else
        @error = "Something went wrong...You are not qualified to be The Ghost of Recursion."
      end
    end
  end

  private

  def victim_params
    params.require(:victim).permit(:name, :email)
  end

end
