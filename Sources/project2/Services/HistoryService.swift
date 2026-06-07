struct HistoryService {
    static func sortedHistory(_ history: [Operation], by option: HistorySortOption) -> [Operation] {
        switch option {
            case .byType:
                 return history.sorted { $0.type.rawValue < $1.type.rawValue  }

           case .byAmount:
                return history.sorted { $0.amount < $1.amount }

           case .newestFirst:
                 return history.reversed()
        }
    }
     static func filterHistory(_ history: [Operation], option: HistoryFilterOption ) -> [Operation] {
        switch option {
            case .all: 
                return history
            case .deposits:
                return history.filter ({ $0.type == .deposit  } )
            case .withdrawals:
                return history.filter ({ $0.type == .withdraw } )
            case .moreThan(let amount):
                return history.filter ({ $0.amount > amount})
        }
    }
}