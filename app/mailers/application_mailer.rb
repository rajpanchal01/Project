# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'inneedweb@gmail.com'
  layout 'mailer'
end
