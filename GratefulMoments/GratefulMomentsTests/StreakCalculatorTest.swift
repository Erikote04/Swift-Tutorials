//
//  GratefulMomentsTests.swift
//  GratefulMomentsTests
//
//  Created by Erik Sebastian de Erice Jerez on 20/11/25.
//

import Foundation
import Testing

@testable import GratefulMoments

struct StreakCalculatorTest {
    let streakCalculator = StreakCalculator()
    let now = Date.now

    @Test func testCalculations() {
        let days = [-2, -1]
        let expectedStreak = 2
        
        let moments = days.map {
            let date = Calendar.current.date(byAdding: .day, value: $0, to: now)!
            return Moment(title: "", note: "", timestamp: date)
        }
        
        let streak = streakCalculator.calculateStreak(for: moments)
        
        #expect(streak == expectedStreak)
    }
}
