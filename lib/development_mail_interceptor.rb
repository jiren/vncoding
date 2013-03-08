class DevelopmentMailInterceptor

  def self.delivering_email(message)
    message.to = "rishi@joshsoftware.com"
  end

end
