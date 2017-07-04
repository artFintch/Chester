//
//  String+Query.swift
//  Chester
//
//  Created by Vyacheslav Khorkov on 14/06/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public extension String {
	
	var flatQuery: String {
		return replacingOccurrences(of: "(\\n|  |\\t)*", with: "", options: .regularExpression)
	}
}
