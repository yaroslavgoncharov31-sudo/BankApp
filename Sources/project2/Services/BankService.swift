struct BankService { 
    static func performOperation(
        operation: OperationComand,
        account: Account
    ) -> OperationResult {
        var updatedAccount = account

    switch operation {
    case .withdraw(let amount):
            guard amount <= updatedAccount.balance else {
                return OperationResult(
                     account: account,
                     isSuccessful: false,
                     operationName: OperationType.withdraw.rawValue
                    )
            }

        updatedAccount.balance -= amount
        updatedAccount.history.append(
            Operation(
                type: .withdraw,
                amount: amount,
                title: nil,
                description: nil
            )
        )

        return OperationResult(
            account: updatedAccount,
            isSuccessful: true,
            operationName: OperationType.withdraw.rawValue
        )

    case .deposit(let amount, let title, let description):
        updatedAccount.balance += amount
        updatedAccount.history.append(
            Operation(
                type: .deposit,
                amount: amount,
                title: title,
                description: description
            )
        )

            return OperationResult(
                account: updatedAccount,
                isSuccessful: true,
                operationName: OperationType.deposit.rawValue
        )
    }
}
}