//
//  ContentVewModel.swift
//  habitto
//
//  Created by K Praneeth on 2/2/25.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var selectedScreen: Screen = .habits
}
