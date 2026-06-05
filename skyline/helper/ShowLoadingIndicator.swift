//
//  LoadingIndicator.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import SwiftUI

struct ShowLoadingIndicator: View {
    var body: some View {
        Spacer()
        HStack {
            Spacer()
            ProgressView()
                .controlSize(.regular)
                .scaleEffect(1.5)
                .tint(.white)
            Spacer()
        }
        
        Spacer()
    }
}

#Preview {
    ShowLoadingIndicator()
}
