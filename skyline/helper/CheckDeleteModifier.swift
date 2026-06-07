//
//  CheckDeleteModifier.swift
//  skyline
//
//  Created by Ehab Salah on 07/06/2026.
//

import SwiftUI

struct DeleteConfirmationModifier<Item>: ViewModifier {
    let title: String
    let message: String
    @Binding var itemToDelete: Item?
    let onDelete: (Item) -> Void
    
    func body(content: Content) -> some View {
        content
            .alert(
                title,
                isPresented: Binding(
                    get: { itemToDelete != nil },
                    set: { newValue in if !newValue { itemToDelete = nil } }
                )
            ) {

                Button("Delete", role: .destructive) {
                    if let item = itemToDelete {
                        onDelete(item)
                    }
                    itemToDelete = nil
                }
                
    
                Button("Cancel", role: .cancel) {
                    itemToDelete = nil
                }
            } message: {
                Text(message)
            }
    }
}

extension View {
    func showDeleteConfirmationAlert<Item>(
        title: String,
        message: String,
        itemToDelete: Binding<Item?>,
        onDelete: @escaping (Item) -> Void
    ) -> some View {
        self.modifier(
            DeleteConfirmationModifier(
                title: title,
                message: message,
                itemToDelete: itemToDelete,
                onDelete: onDelete
            )
        )
    }
}
