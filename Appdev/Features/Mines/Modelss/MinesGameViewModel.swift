//
//  MinesGameViewModel.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 29/08/25.
//

import Foundation
enum Difficulty1 {
    case easy
    case medium
    case hard
}

class MinesGameViewModel: ObservableObject{
    @Published var cards1:[Cards1]=[]
    @Published var score:[Int]=[0,0]
    @Published var currplayid:Int=0
    private var flippedCards:[Int]=[]
    private var score1:Int=0
    private var isProcessing:Bool=false
    private var mode:Difficulty = .easy
    @Published var winnertext1:String=""
    private var win:Bool=true
    
    init(mode:Difficulty = .easy){
        SetupGame(mode:mode)
    }
    
    func SetupGame(mode:Difficulty){
        self.mode=mode
        let allImages = [
            "cat1","cat2","cat3","cat4","cat5","cat6","cat7","cat8","cat9","cat10","cat11","cat12"
        ]
        let bombImage = ["bomb","bomb","bomb","bomb","bomb","bomb","bomb","bomb","bomb","bomb","bomb","bomb"]
        
        let number: Int
        let number1: Int
        switch mode {
        case .easy:
            number = 6
            number1 = 4
        case .medium:
            number = 8
            number1 = 8
        case .hard:
            number = 10
            number1 = 12
        }
        var selectedImages=Array(allImages.prefix(number)) + Array(bombImage.prefix(number1))
        
        
        selectedImages.shuffle()
        cards1 = selectedImages.map { imageName in
            Cards1(frontImage: imageName, backImage: "back")
            score1=0
            win=true
            
        }
    }
        func flipCard(at i: Int) {
            guard i>=0 && i<cards1.count else { return }
            if(cards1[i].backImage=="bomb"){
                win=false
                gameEnds()
                return
            }
            score1=score1+1
            
        }
        func resetgame(){
            SetupGame(mode: mode)
        }
        func gameEnds(){
            if(win){
                winnertext1="You win 🎉"
            }
            else{
                winnertext1="You lose 😔"
            }
        }
    }
    
}
