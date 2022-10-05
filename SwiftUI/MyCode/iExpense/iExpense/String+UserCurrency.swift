//
//  String+UserCurrency.swift
//  iExpense
//
//  Created by Oscar Fridh on 2022-10-05.
//

import Foundation

extension String {
    static var userCurrencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
}
