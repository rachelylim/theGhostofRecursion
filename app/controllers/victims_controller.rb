class VictimsController < ApplicationController

  def new
    @victim = Victim.new
  end

  def create
    @victim = Victim.new(victim_params)

    if @victim.save
      VictimMailer.cursed_email(@victim).deliver_now
      redirect_to success_path
    else
      redirect_to fail_path
    end
  end

  def success
    @success = "Congratulations. You've successfully cursed your victim."
  end
  
  private

  def victim_params
    params.require(:victim).permit(:name, :email)
  end

end
