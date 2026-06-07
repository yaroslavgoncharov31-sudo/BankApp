struct App {
    private var account = Account(balance: 0)
    private var menuIsRunning = true

    mutating func run() {
        while menuIsRunning {
            
            Menu.showMainMenu()

            guard let input = readLine(), !input.isEmpty else {
                print("Wrong input.")
                continue
            }

            switch input {
            case "1":
                Menu.showBalance(account: account)

            case "2":
                    guard let amount = InputReader.readAmount(prompt: "How much?") else { break }
                    let result = BankService.performOperation(
                         operation: OperationComand.withdraw(amount: amount),
                         account: account)

                            account = result.account
                        if result.isSuccessful {
                            Menu.showBalanceAfterOperation(
                            operationName: result.operationName,
                            balance: account.balance)
                  } else {
                             Menu.showOperationFailed()
                }

            case "3":
                    guard let amount = InputReader.readAmount(prompt: "How much?") else { break }
                    guard let title = InputReader.readTitle() else { break }

                    let description = InputReader.readDescription()

                    let result = BankService.performOperation(
                        operation: OperationComand.deposit(amount: amount, title: title, description: description),
                         account: account )
                        account = result.account
                if result.isSuccessful {
                         Menu.showBalanceAfterOperation(
                         operationName: result.operationName,
                         balance: account.balance)   
                } else {
                     Menu.showOperationFailed()
                 }
            case "4":
                Menu.showHistory(account.history) 

            case "5":
               guard let option = InputReader.readHistorySortOption() else { break }

               let sortedHistory = HistoryService.sortedHistory(
                    account.history,
                    by: option )

                    Menu.showHistory(sortedHistory)
            case "6":
                guard let option = InputReader.readHistoryFilterOption() else { break }

                let filteredHistory = HistoryService.filterHistory(
                     account.history,
                     option: option)
                     Menu.showHistory(filteredHistory)
            case "7":
                menuIsRunning = false

            default:
                print("Invalid input")
            }
        }
        
    }
}