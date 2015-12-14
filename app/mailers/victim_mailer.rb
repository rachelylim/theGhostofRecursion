class VictimMailer < ApplicationMailer
   default from: 'theGhostofRecursion@thedarkside.com'

   def cursed_email(victim)
    @victim = victim
    # @url = "http://localhost.com:3000/victims/new_victim"

    mail (to: @victim.email, subject: "You've Been Recursed!")
   end
end
