  
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

  }