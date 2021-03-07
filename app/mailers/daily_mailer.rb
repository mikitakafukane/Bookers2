class DailyMailer < ApplicationMailer

  def say_hello

    mail(
      subject: "今日もこんにちは！" ,
      to: User.pluck(:email)
      )
  end
end
