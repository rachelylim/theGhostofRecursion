class VictimsController < ApplicationController

  def new
    @victim = Victim.new
  end

  def create
    @victim = Victim.new(params[:victim])

    respond_to do |f|
      if @victim.save
        GhostMailer.cursed_email(@victim).deliver_now

        render "index/success"
        # format.html { redirect_to(@victim, notice: 'User was successfully created.') }
        # format.json { render json: @victim, status: :created, location: @victim }
      else
        @error = "Something went wrong...You are not qualified to be The Ghost of Recursion."
      end
  end


end
