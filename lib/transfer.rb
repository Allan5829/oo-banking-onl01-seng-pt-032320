class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize (sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    if (@sender.valid? == true) && 
        (@receiver.valid? == true)
        return true
      else 
        return false 
      end 
  end 
  
  def execute_transaction
    if (valid? == true)
      @sender.sending(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    elsif (valid? == false) 
      @status = "rejected"  
      return "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    if (@status == "complete")
      @receiver.sending(self.amount)
      @sender.deposit(self.amount)
      @status = "reversed"
    end 
  end 
  
end
