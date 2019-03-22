//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Shalise Ayromloo on 3/22/19.
//

import Foundation

struct Athlete {
    var name: String
    var age: String
    var league: String
    var team: String
} //closes struct

extension Athlete: CustomStringConvertible {
    var description: String {
        return "\(name) is \(age) years old and play for the \(team) in the \(league)."
    } //closes description
} //closes struct


