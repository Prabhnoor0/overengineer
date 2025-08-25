//
//  Canvas.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 25/08/25.
//
//fromstackoverflow
import SwiftUI

struct DrawExample: View {

    @State var points: [CGPoint] = []

    var body: some View {

        ZStack {
            Rectangle() // replace it with what you need
                .foregroundColor(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .gesture(DragGesture().onChanged( { value in
                    self.addNewPoint(value)
                })
                .onEnded( { value in
                    // here you perform what you need at the end
                }))


            DrawShape(points: points)
                .stroke(lineWidth: 5) // here you put width of lines
                .foregroundColor(.blue)
        }

    }

    private func addNewPoint(_ value: DragGesture.Value) {
        // here you can make some calculations based on previous points
        points.append(value.location)
    }

}

struct DrawShape: Shape {

    var points: [CGPoint]

    // drawing is happening here
    func path(in rect: CGRect) -> Path {
        var path = Path()
        guard let firstPoint = points.first else { return path }

        path.move(to: firstPoint)
        for pointIndex in 1..<points.count {
            path.addLine(to: points[pointIndex])

        }
        return path
    }
}

