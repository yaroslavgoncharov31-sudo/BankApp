  
  struct InputReader { 
    static func readAmount(prompt: String) -> Double? {
        print(prompt)
        guard let input = readLine(),
             let result = Double(input),
              result > 0 && result < 10_000 else {
            print("Invalid input.")
            return nil
        }

        return result
    }

    static func readDescription() -> String? {
         print("Enter a description (optional):")
    return readLine().flatMap { $0.isEmpty ? nil : $0 }
    }
    

    static func readTitle() -> String? {
        print("Enter a title for operation:")

        guard let input = readLine(), !input.isEmpty else {
            print("Title required")
            return nil
        }

        return input
    }
    static func readHistoryFilterOption() -> HistoryFilterOption? {
         print("""
    Choose history filter:
    1. All
    2. Deposits
    3. Withdrawals
    4. More than
    """)
    guard let input = readLine() else {
        return nil
    }

    switch input {
        case "1":
            return .all
        case "2":
            return .deposits
        case "3": 
            return .withdrawals
        case "4":
        guard let input = readAmount(prompt: "More than how much?") else {
            return nil
        }
            return .moreThan(input)
        default:
            Menu.showOperationFailed()
            return nil
    }
    }

    static func readHistorySortOption() -> HistorySortOption? {
         print("""
    Choose history sort:
    1. By type
    2. By amount
    3. Newest first
    """)
    guard let input = readLine() else {
        return nil
    }

    switch input {
        case "1":
            return .byType
        case "2":
            return .byAmount
        case "3": 
            return .newestFirst
        default:
            Menu.showOperationFailed()
            return nil
    }
    } 
  }