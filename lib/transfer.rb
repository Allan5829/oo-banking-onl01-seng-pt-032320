require 'pry'
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
    #binding.pry
    if valid? == true && @status == "pending"
      #binding.pry
      @sender.withdraw (@amount)
      @receiver.deposit (@amount)
      @status = "complete"
    elsif (valid? == false) || @status == "complete" 
      @status = "rejected"  
      return "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    if (@status == "complete")
      @receiver.withdraw (@amount)
      @sender.deposit (@amount)
      @status = "reversed"
    end 
  end 
  
end
