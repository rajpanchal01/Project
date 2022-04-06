class MemberMailer < ApplicationMailer
    default from: 'project management tool'

def new_member_email
    @member = params[:member]

    mail(to: User.find(@member.user_id).email, subject: "You are added to new project!")
  end
end