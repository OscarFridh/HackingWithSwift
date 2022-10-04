//
//  Expenses.swift
//  iExpense
//
//  Created by Oscar Fridh on 2022-10-04.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
