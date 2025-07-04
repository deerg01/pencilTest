//
//  MapView.swift
//  pencilTest
//
//  Created by POS on 7/1/25.
//

import SwiftUI
import MapKit

// UI part
struct MapDrawView: View {
    // 카메라 포지션이 뭘까..
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            // 임의로 표시될 지도(좌표)를 지정: 포항시청
            center: CLLocationCoordinate2D(latitude: 36.0205, longitude: 129.3432),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    var body: some View {
        ZStack {
            Map(position: $cameraPosition)

            MapDrawingView()
                .allowsHitTesting(true) //user touch interaction을 input으로 감지하겠다
        }
    }
}
