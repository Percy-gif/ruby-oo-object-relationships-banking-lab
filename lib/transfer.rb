class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender,receiver,status="pending",amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  def valid?
    if sender.valid? && receiver.valid?
      true
      else
      false
      end
  end
  def execute_transaction
    if self.status == "complete"
      return
    end
    if self.valid? && self.amount < sender.balance
      receiver.balance += self.amount
      sender.balance -= self.amount
      self.status = "complete"      
      else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end
  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    end
  end
end