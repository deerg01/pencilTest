//
//  ArchiveView 2.swift
//  pencilTest
//
//  Created by POS on 6/25/25.
//

import SwiftUI
import SwiftData
import PencilKit

struct ArchiveView: View {
    @Query var archives: [Archive]

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(archives, id: \.id) { archive in
                        NavigationLink(destination: SavedPicView(drawingData: archive.drawingData)) {
                            Thumbnail(drawingData: archive.drawingData)
                                .frame(height: 150)
                                .cornerRadius(8)
                                .shadow(radius: 2)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Archive")
        }
    }

    // 따로 파일 통신이나 데이터처리 없이 드로잉데이터 썸네일화 ... kinda실패!
    struct Thumbnail: UIViewRepresentable {
        let drawingData: Data

        func makeUIView(context: Context) -> PKCanvasView {
            let canvas = PKCanvasView()
            canvas.isUserInteractionEnabled = false
            canvas.backgroundColor = .white
            if let drawing = try? PKDrawing(data: drawingData) {
                canvas.drawing = drawing
            }
            return canvas
        }

        func updateUIView(_ uiView: PKCanvasView, context: Context) {}
    }
}


