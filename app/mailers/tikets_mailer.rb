class TiketsMailer < ApplicationMailer

  def buy_tiket(user, tiket)
    @user = user
    @tiket = tiket
    mail(to: user.email, subject: 'Вы купили билет')
  end

  def delete_tiket(user, tiket)
    @user = user
    @tiket = tiket
    mail(to: user.email, subject: 'Вы удалили билет')
  end
end
