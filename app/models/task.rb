class Task < ActiveRecord::Base
  belongs_to :user

  def notify_assignee
    Pony.mail :to => self.user.email, 
              :from => 'tracker@ehealthinnovation.org',
              :subject => "Todo: " + self.task_name,
              :body => email_body
  end

  def email_body
    <<-EOF
      Todo: #{self.task_name}
      Completed?: #{self.completed}
      Content: #{self.description}
    EOF
  end
end
