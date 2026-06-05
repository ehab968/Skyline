//
//  ErrorAlertModifier.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import SwiftUI


struct ErrorAlertModifier: ViewModifier {
    let title: String
    @Binding var errorMessage: String?
    
    func body(content: Content) -> some View {
        content
            .alert(
                title,
                isPresented: Binding(
                    get: { errorMessage != nil },
                    set: { newValue in if !newValue { errorMessage = nil } }
                )
            ) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage ?? "Unknown Error occurred.")
            }
    }
}


extension View {
    func showErrorAlert(title: String = "Error", errorMessage: Binding<String?>) -> some View {
        self.modifier(ErrorAlertModifier(title: title, errorMessage: errorMessage))
    }
}
