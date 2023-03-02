////
// RollDice
// Created by: itsjagnezi on 02/03/23
// Copyright (c) today and beyond
//

import SwiftUI

extension View {
	/// Applies the given transform if the given condition evaluates to `true`.
	/// - Parameters:
	///   - condition: The condition to evaluate.
	///   - transform: The transform to apply to the source `View`.
	/// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
	@ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
		if condition {
			transform(self)
		} else {
			self
		}
	}
}

struct MarkPosition: Identifiable {
	let id = UUID()
	let x: CGFloat
	let y: CGFloat
	let isVisible: Bool
	let color: Color
}

struct ContentView: View {
	
	let markDiameter: CGFloat = 55
	
	@State private var rollDice = 6
	@State private var timesRolled = 0
	@State private var lastRolledSize = 0
	
	@State private var feedback = UINotificationFeedbackGenerator()
	
	var body: some View {
		VStack {
			Button("Roll dice") {
				lastRolledSize = rollDice
				rollDice = Int.random(in: 1...6)
				timesRolled = timesRolled + 1
				
				feedback.notificationOccurred(.success)
			}
			.font(.largeTitle)
			.buttonStyle(.bordered)
			
			Text("Times rolled: \(timesRolled)")
				.font(.title)
			
			ZStack {
				GeometryReader { geo in
					
					let diceFacesDictionary = [
						1: [
							MarkPosition(
								x: geo.frame(in: .local).midX,
								y: geo.frame(in: .local).midY,
								isVisible: true, color: .red),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: false, color: .cyan),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: false, color: .brown),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: false, color: .blue),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: false, color: .purple),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: false, color: .gray),
						],
						2: [
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: true, color: .red),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: false, color: .cyan),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: false, color: .brown),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: false, color: .blue),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: false, color: .purple),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: true, color: .gray),
						],
						3: [
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: true, color: .red),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: false, color: .cyan),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: false, color: .brown),
							
							MarkPosition(
								x: geo.frame(in: .local).midY,
								y: geo.frame(in: .local).midX,
								isVisible: true, color: .blue),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: false, color: .purple),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: true, color: .gray),
						],
						4: [
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: true, color: .red),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: false, color: .cyan),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: true, color: .brown),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: true, color: .blue),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: false, color: .purple),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: true, color: .gray),
						],
						5: [
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: true, color: .red),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: false, color: .cyan),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: true, color: .brown),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: true, color: .blue),
							
							MarkPosition(
								x: geo.frame(in: .local).midX,
								y: geo.frame(in: .local).midY,
								isVisible: true, color: .purple),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: true, color: .gray),
						],
						6: [
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: true, color: .red),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: true, color: .cyan),
							
							MarkPosition(
								x: geo.frame(in: .local).minX + markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: true, color: .brown),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).minY + markDiameter,
								isVisible: true, color: .blue),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).midY,
								isVisible: true, color: .purple),
							
							MarkPosition(
								x: geo.frame(in: .local).maxX - markDiameter,
								y: geo.frame(in: .local).maxY - markDiameter,
								isVisible: true, color: .gray),
						]
					]
					
					Rectangle()
						.frame(width: 300, height: 300)
						.cornerRadius(36)
					
					ForEach(diceFacesDictionary[rollDice]!) { diceSize in
						
						
						Circle()
							.foregroundColor(diceSize.color)
							.frame(width: markDiameter, height: markDiameter)
							.position(
								x: diceSize.x,
								y: diceSize.y
							)
							.if(diceSize.isVisible == false) { view in
								view.hidden()
							}
					}
				}
			}
			.frame(width: 300, height: 300)
			.animation(.spring(), value: rollDice)
			
			Group {
				if lastRolledSize == 0 {
					Text("Never rolled!")
				} else {
					Text("Last rolled size: \(lastRolledSize)")
				}
			}
			.font(.title)
		}
		.onAppear(perform: { feedback.prepare() })
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
