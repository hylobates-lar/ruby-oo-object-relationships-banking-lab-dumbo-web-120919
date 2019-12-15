class Transfer
  attr_accessor :sender, :receiver, :amount, :status 

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end

    def valid?
      sender.valid? && receiver.valid? && sender.balance > amount
    end

    def execute_transaction
      if self.valid? && self.status != "complete"
        self.status = "complete"
        sender.balance -= self.amount  
        receiver.balance += self.amount
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.status == "complete"
        self.status = "reversed"
        sender.balance += self.amount  
        receiver.balance -= self.amount
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
end
