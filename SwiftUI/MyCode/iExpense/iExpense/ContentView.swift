//
//  ContentView.swift
//  iExpense
//
//  Created by Oscar Fridh on 2022-10-03.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(["Personal", "Business"], id: \.self) { expenseType in
                    Section(expenseType) {
                        ForEach(expenses(ofType: expenseType)) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: .userCurrencyCode))
                                    .expenseAmount(item.amount)
                            }
                        }
                        .onDelete { items in
                            let expenses = expenses(ofType: expenseType)
                            removeItems(items.map { expenses[$0] })
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func expenses(ofType type: String) -> [ExpenseItem] {
        expenses.items.filter { $0.type == type }
    }
    
    func removeItems(_ toRemove: [ExpenseItem]) {
        expenses.items.removeAll { toRemove.contains($0) }
    }
}

extension View {
    func expenseAmount(_ amount: Double) -> some View {
        modifier(ExpenseAmount(amount: amount))
    }
}

struct ExpenseAmount: ViewModifier {
    let amount: Double
    
    var color: Color {
        switch amount {
        case ..<10: return .green
        case 10..<100: return .yellow
        default: return .red
        }
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
