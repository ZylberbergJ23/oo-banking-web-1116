class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount 

  def initialize(sender,receiver,amount)
  	@sender = sender 
  	@status = "pending"
  	@receiver = receiver
  	@amount = amount
  end

  	def valid?
  		if @sender.valid? && @receiver.valid?
  			true
  		else 
  			false 	
  		end	
  	end 

def execute_transaction
  if status == "pending"
    sender.balance = sender.balance - amount
    receiver.balance = receiver.balance + amount 
    @status = 'complete' 
  end

  if !sender.valid?
  	 @status = "rejected"
  	"Transaction rejected. Please check your account balance."
  end 	
end 

def reverse_transfer
	if @status == 'complete'
		sender.balance = sender.balance + amount 
		receiver.balance = receiver.balance- amount
		@status = "reversed"
	end 	

end   

end