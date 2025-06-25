//
//  Draw.swift
//  pencilTest
//
//  Created by POS on 6/25/25.
//

import SwiftUI
import PencilKit

struct DrawingView: View {
    @State private var canvasView = PKCanvasView()
    @State private var toolPicker = PKToolPicker() // 플로팅 툴바
    @State private var selectedTool: PKTool = PKInkingTool(.pen, color: .black, width: 5)

    var body: some View {
        VStack {
            ToolBarView(canvasView: $canvasView, selectedTool: $selectedTool)
            
            CanvasView(canvasView: $canvasView, toolPicker: $toolPicker, selectedTool: $selectedTool)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
        }
        .onAppear { // swiftUI에서 쓰려면 이렇게 수동으로 해줘야함
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            canvasView.becomeFirstResponder()
            canvasView.tool = selectedTool
        }
    }
}
