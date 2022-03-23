//
//  Pie.swift
//  Memory-A2
//
//  Created by Jake Mac on 3/11/22.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        // You can either move the "pen" to a point OR Add lines and arcs for your ships
        // This simply dries the pie behind our emoji
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            // Need to invert because origin is TOP LEFT and not TOP RIGHT
            clockwise: !clockwise
        )
        p.addLine(to: center)
        
        return p
    }
    
}
