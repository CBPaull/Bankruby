class BankAccount
	@@customer_count = 0
	def initialize (savings, checking)
		@savings_balance = savings
		@checking_balance = checking
		@interest_rate = '5%'
		@account_number = Random.rand(1000000..9999999)
		@@customer_count += 1
	end
	attr_reader :savings_balance
	attr_reader :checking_balance
	def deposit (account, amount)
		if account == "checking"
			@checking_balance += amount
			puts "New Balance: #{@checking_balance}"
		elsif account == "savings"
			@savings_balance += amount
			puts "New Balance: #{@savings_balance}"
		else 
			puts "account not valid, specify savings or checking"
		end
		return self
	end
	def withdraw (account, amount)
		if account == "checking"
			if amount <= @checking_balance
				@checking_balance -= amount
			else 
				puts "Insufficient funds"
			end
		elsif account == "savings"
			if amount <= @savings_balance
				@checking_balance -= amount
			else 
				puts "Insufficient funds"
			end
		else 
			puts "account not valid, specify savings or checking"
		end
		return self
	end
	def total_cash
		puts "This account has #{@checking_balance} in checking and #{@savings_balance} in savings, for a total of #{@checking_balance + @savings_balance} Dollars."
		return self
	end
	def account_information
		puts "Account Number: #{@account_number}"
		puts "Total Cash: #{@checking_balance + @savings_balance}"
		puts "Checking Account Balance: #{@checking_balance}"
		puts "Savings Account Balance: #{@savings_balance}"
		puts "Interest Rate: #{@interest_rate}"
		return self
	end
end
Bob = BankAccount.new(1000, 2000)
Bob.savings_balance
Bob.checking_balance
Bob.withdraw('checking', 500).deposit('savings', 3000).total_cash.account_information