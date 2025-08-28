//
//  MemoryGameViewModel.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 27/08/25.
//


import SwiftUI

enum Difficulty {
    case easy
    case medium
    case hard
}

class MemoryGameViewModel: ObservableObject{
    @Published var cards:[Card]=[]
    @Published var score:[Int]=[0,0]
    @Published var currplayid:Int=0
    private var flippedCards:[Int]=[]
    private var isProcessing:Bool=false
    private var mode:Difficulty = .easy
    
    init(mode:Difficulty = .easy){
        SetupGame(mode:mode)
    }
    
    func SetupGame(mode:Difficulty){
        self.mode=mode
        let allImages = [
            "cat1","cat2","cat3","cat4","cat5","cat6","cat7","cat8","cat9","cat10","cat11","cat12"
        ]
        
        let numberOfPairs: Int
        switch mode {
        case .easy: numberOfPairs = 6
        case .medium: numberOfPairs = 8
        case .hard: numberOfPairs = 10
        }
       // let frontImage:"Cat"
        
        let selectedImages = Array(allImages.prefix(numberOfPairs))
        
        var images = selectedImages + selectedImages
        
        images.shuffle()
        
        cards = images.enumerated().map{index,image in
            Card(frontImage:"Cat", backImage:image)
        }
        flippedCards.removeAll()
        score=[0,0]
        currplayid=0
        isProcessing=false
        
        
    }
    
    func flipCard(at i: Int) {
        guard i>=0 && i<cards.count else { return }
        guard !cards[i].isMatched, !cards[i].isFlipped else { return }
        
        cards[i].isFlipped = true
        flippedCards.append(i)
       
        
        if flippedCards.count == 2 {
            isProcessing=true
            let first = flippedCards[0]
            let second = flippedCards[1]
            
            if cards[first].frontImage == cards[second].frontImage {
                cards[first].isMatched = true
                cards[second].isMatched = true
                score[currplayid]+=1
                flippedCards.removeAll()
                isProcessing=false
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.cards[first].isFlipped = false
                    self.cards[second].isFlipped = false
                    self.flippedCards.removeAll()
                    self.isProcessing=false
                    self.changeplayer()
                    
                }
            }
        }
    }
    func changeplayer(){
        if(currplayid==0){
            currplayid=1
        }else{
            currplayid=0
        }
    }
    func resetgame(){
        SetupGame(mode: mode)
    }
}
 
   /* var flipCount = 0
    var flipCount1:[String] = []
    var matchArray:[String] = []

    func remove1(flipCount:inout Int,flipCount1: inout[String]){    //used inout so that array can be mutated
        if(flipCount==2 && flipCount1.count==2){
            if flipCount1[0] != flipCount1[1] {
                flipCount1.removeAll()
                flipCount = 0
            }
            match(flipCount1: &flipCount1)
            
        }
    }

    func checkflipcount(){
        if(flipCount==2){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                remove1(flipCount: &flipCount,flipCount1:&flipCount1)
            }
        }
    }

    func match(flipCount1:inout[String]){
        if(flipCount1.count==2){
            if(flipCount1[0]==flipCount1[1]){
                matchArray.append(flipCount1[0])
                matchArray.append(flipCount1[1])
                flipCount1.removeAll()
            }
              
        }
    }

    func flipCard(card: String) {
        if (!matchArray.contains(where:{$0==card})) {
            flipCount1.append(card)
            flipCount += 1
            checkflipcount()
            match(flipCount1: &flipCount1)
        }
    }

    func isMatched(card: String) -> Bool {
        return matchArray.contains(where: { $0 == card })
    }


}
*/
