//
//  ErrorView.swift
//  ScrumRecorder
//
//  Created by Chad Smith on 2/27/22.
//

import SwiftUI

struct ErrorView: View {
    @Environment(\.dismiss) private var dismiss
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        NavigationView {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding()
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    static var wrapper = ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error message")
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
