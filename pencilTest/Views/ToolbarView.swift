import PencilKit
import SwiftData
//
//  ToolbarView.swift
//  pencilTest
//
//  Created by POS on 6/25/25.
//
import SwiftUI

struct ToolBarView: View {
    @Environment(\.modelContext) private var context
    @Binding var canvasView: PKCanvasView
    @Binding var selectedTool: PKTool

    @State private var showArchive = false

    let colors: [UIColor] = [.black, .red, .blue, .green, .orange]
    
    var body: some View {
        HStack {
//            // 그리는 도구
//            Button(action: {
//                selectedTool = PKInkingTool(.pen, color: .black, width: 5)
//                canvasView.tool = selectedTool
//            }) {
//                Image(systemName: "pencil")
//            }
//
//            // 지우개
//            Button(action: {
//                selectedTool = PKEraserTool(.vector)
//                canvasView.tool = selectedTool
//            }) {
//                Image(systemName: "eraser")
//            }
//
//            // 크롭? 올가미? 도구
//            Button(action: {
//                selectedTool = PKLassoTool()
//                canvasView.tool = selectedTool
//            }) {
//                Image(systemName: "scissors")
//            }
//
//            Spacer()
            
            // 아카이브 리스트표시
            Button(action: {
                showArchive = true
            }) {
                Image(systemName: "folder")
            }
            .sheet(isPresented: $showArchive) {
                ArchiveView()
            }

            // 저장 버튼 (아카이브로 이동)
            Button(action: {
                let drawing = canvasView.drawing
                let archive = Archive(drawing: drawing)
                context.insert(archive)
                try? context.save()
                canvasView.drawing = PKDrawing()
            }) {
                Image(systemName: "square.and.arrow.down")
            }

            Spacer()

            // PKCanvasView는 자체 undoManager가 있다(!!)
            // Undo
            Button(action: {
                canvasView.undoManager?.undo()
            }) {
                Image(systemName: "arrow.uturn.backward")
            }
            // Redo
            Button(action: {
                canvasView.undoManager?.redo()
            }) {
                Image(systemName: "arrow.uturn.forward")
            }
            // Clear. PKDrawing은 드로잉 '객체'. empty object를 호출해서 리셋
            Button(action: {
                canvasView.drawing = PKDrawing()
            }) {
                Image(systemName: "trash")
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
    }
}
