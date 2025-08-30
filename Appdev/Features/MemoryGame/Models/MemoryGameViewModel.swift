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
    @Published var winnertext1:String=""
    
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
    func allMatched() -> Bool {
        return cards.allSatisfy { $0.isMatched }
    }
    func winner(){
        if(score[0]>score[1]){
            winnertext1="Player 1 wins"
        }
        else if(score[0]<score[1]){
            winnertext1="Player 2 wins"
        }
        else{
            winnertext1="Tie"
        }
    }

    func flipCard(at i: Int) {
        guard i>=0 && i<cards.count else { return }
        guard !cards[i].isMatched, !cards[i].isFlipped,!isProcessing else { return }
        
        cards[i].isFlipped = true
        flippedCards.append(i)
       
        
        if flippedCards.count == 2 {
            isProcessing=true
            let first = flippedCards[0]
            let second = flippedCards[1]
            
            if cards[first].backImage == cards[second].backImage {
                cards[first].isMatched = true
                cards[second].isMatched = true
                score[currplayid]+=1
                if(allMatched()){
                   winner()
                }
                flippedCards.removeAll()
                isProcessing=false
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
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
 
