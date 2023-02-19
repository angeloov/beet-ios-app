//
//  Extentions.swift
//  beet
//
//  Created by Angelo Voicu on 27/12/22.
//

import SwiftUI

extension Text {
		public func foregroundLinearGradient(
				colors: [Color],
				startPoint: UnitPoint,
				endPoint: UnitPoint) -> some View
		{
				self.overlay {

						LinearGradient(
								colors: colors,
								startPoint: startPoint,
								endPoint: endPoint
						)
						.mask(
								self

						)
				}
		}
	
	public func applyBeetGradient() -> some View {
		return self.foregroundLinearGradient(colors: [Color(hex: 0xAEAEAE), .white, Color(hex: 0xADADAD)], startPoint: .bottomLeading, endPoint: .topTrailing)
	}
}

extension Color {
		init(hex: UInt, alpha: Double = 1) {
				self.init(
						.sRGB,
						red: Double((hex >> 16) & 0xff) / 255,
						green: Double((hex >> 08) & 0xff) / 255,
						blue: Double((hex >> 00) & 0xff) / 255,
						opacity: alpha
				)
		}
}
