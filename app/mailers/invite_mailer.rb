class InviteMailer < ActionMailer::Base
	default from: 'steph.prayerapp@example.com'
 
  # To really send out a email:
  # InviteMailer.invite_to_group(Invite.last).deliver_now
  def invite_to_group(invite)
    @user  = invite.recipient
    @group = invite.group
    @url   = verify_url(invite.token)
    mail(to: invite.email, subject: 'Welcome!')
  end
end