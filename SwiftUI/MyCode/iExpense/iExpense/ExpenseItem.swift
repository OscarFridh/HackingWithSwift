//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Oscar Fridh on 2022-10-04.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
}
