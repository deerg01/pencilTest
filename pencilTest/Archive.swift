//
//  Archive.swift
//  pencilTest
//
//  Created by POS on 6/25/25.
//

import Foundation
import SwiftData
import PencilKit

@Model
class Archive {
    @Attribute(.unique) var id: UUID
    var date: Date
    var drawingData: Data

    init(drawing: PKDrawing) {
        self.id = UUID()
        self.date = Date()
        self.drawingData = drawing.dataRepresentation()
    }
}
