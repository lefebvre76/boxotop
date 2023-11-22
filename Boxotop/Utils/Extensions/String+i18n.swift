//
//  String+i18n.swift
//  Boxotop
//
//  Created by loic lefebvre on 22/11/2023.
//

import Foundation

extension String {
    func localized(arguments: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments)
    }
}
