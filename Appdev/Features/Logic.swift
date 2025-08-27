//
//  Logic.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 27/08/25.
//

import Foundation
import SwiftUI


var flipCount = 0
var flipCount1:[[String]] = []
var matchArray:[[String]] = []

func remove1(flipCount:inout Int,flipCount1: inout[[String]]){    //used inout so that array can be mutated
    var i=0
    while(flipCount>2){
        flipCount1.remove(at: i)
        i=i+1
        flipCount-=1
    }
    
}
func checkflipcount(){
    if(flipCount>2){
        remove1(flipCount: &flipCount,flipCount1:&flipCount1)
    }
}
func match(flipCount1:inout[[String]]){
    if(flipCount1.count==2){
        if(flipCount1[0][0]==flipCount1[1][0]){
            matchArray.append(flipCount1[0])
            matchArray.append(flipCount1[1])
            flipCount1.removeAll()
        }
          
    }
}
func flipCard(card: [String]) {
    if (!matchArray.contains(where:{$0==card})) {
        flipCount1.append(card)
        flipCount += 1
        checkflipcount()
        match(flipCount1: &flipCount1)
    }
}
func isMatched(card: [String]) -> Bool {
    return matchArray.contains(where: { $0 == card })
}

