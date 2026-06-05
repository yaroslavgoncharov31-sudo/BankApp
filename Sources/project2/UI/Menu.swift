struct Menu {
    static func showMainMenu() {
        print("""
            Hello!
            1. Show balance
            2. Withdraw
            3. Deposit
            4. Exit
            """)
    }
    static func showBalance(account: Account) {
        print("Your balance is \(account.balance).")
    }

    static func showBalanceAfterOperation(operationName: String, balance: Double) {
        print("Successful \(operationName)! Your balance after operation is: \(balance)")
    }

    static func showOperationFailed() {
        print("Operation failed.")
    }

    static func showHistory(account: Account) {
        for(index, operation) in account.history.enumerated() {
            print("\(index + 1). \(operation.type.rawValue): \(operation.amount)")
        }
    }
    
}