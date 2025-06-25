//
//  SavedPicView.swift
//  pencilTest
//
//  Created by POS on 6/25/25.
//
import SwiftUI
import PencilKit

struct SavedPicView: View {
    let drawingData: Data

    var body: some View {
        DrawingPreview(drawingData: drawingData)
            .navigationTitle("Saved Drawing")
    }
}

struct DrawingPreview: UIViewRepresentable {
    let drawingData: Data

    func makeUIView(context: Context) -> PKCanvasView {
        let canvas = PKCanvasView()
        if let drawing = try? PKDrawing(data: drawingData) {
            canvas.drawing = drawing
        }
        canvas.isUserInteractionEnabled = false
        return canvas
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}

