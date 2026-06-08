import Foundation

struct AccountStorage {
    private static let fileName = "account.json"

    static func loadAccount() -> Account {
        let url = URL(fileURLWithPath: fileName)

        guard let data = try? Data(contentsOf: url) else {
            return Account(balance: 0)
        }

        guard let account = try? JSONDecoder().decode(Account.self, from: data) else {
            return Account(balance: 0)
        }

        return account
    }

    static func save(account: Account) {
        let url = URL(fileURLWithPath: fileName)

        guard let data = try? JSONEncoder().encode(account) else {
            print("Failed to encode account.")
            return
        }

        do {
            try data.write(to: url)
        } catch {
            print("Failed to save account.")
        }
    }
}