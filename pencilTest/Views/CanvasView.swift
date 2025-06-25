//
//  CanvasView.swift
//  pencilTest
//
//  Created by POS on 6/25/25.
//

import SwiftUI
import PencilKit

// wrapping UIKit part for suiting swiftUI
struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    @Binding var toolPicker: PKToolPicker
    @Binding var selectedTool: PKTool
    
    //UIKit으로 작성된 view를 swiftUI에서 setup할 수 있게 함
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = selectedTool
        return canvasView
    }
    
    //수정이나 상태변화가 발생했을 때 UIKit view에 수정반영을 요청
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = selectedTool
    }
}

