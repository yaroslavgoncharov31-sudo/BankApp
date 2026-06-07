enum HistorySortOption {
    case byType
    case byAmount
    case newestFirst
}

enum HistoryFilterOption {
    case all
    case deposits
    case withdrawals
    case moreThan(Double)
}