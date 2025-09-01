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
    @Published var currplayid:Int=0
    private var flippedCards:[Int]=[]
    @Published var score1:Int=0
    private var isProcessing:Bool=false
    private var mode:Difficulty1 = .easy
    @Published var winnertext1:String=""
    @Published var current:Int=0
    @Published var scorearray:[Int]=[0,0]
    private var win:Bool=false
    @Published var gameover:Bool=false
    
    init(mode:Difficulty1 = .easy){
        SetupGame(mode:mode)
    }
    
    func SetupGame(mode:Difficulty1){
        self.mode=mode
        let allImages = [
            "cat1","cat2","cat3","cat4","cat5","cat6","cat7","cat8","cat9","cat10","cat11","cat12"
        ]
        let bombImage = ["dog","dog","dog","dog","dog","dog","dog","dog","dog"]
        
        let number: Int
        let number1: Int
        switch mode {
        case .easy:
            number = 7
            number1 = 5
        case .medium:
            number = 9
            number1 = 7
        case .hard:
            number = 11
            number1 = 9
        }
        var selectedImages=Array(allImages.prefix(number)) + Array(bombImage.prefix(number1))
        
        
        selectedImages.shuffle()
        cards1 = selectedImages.enumerated().map { index, imageName in
            Cards1(frontImage:"Cat",backImage:imageName)
                }
        scorearray=[0,0]
        current=0
            win=false
            gameover=false
        flippedCards.removeAll()
            
        }
    
        func flipCard(at i: Int) {
            guard i>=0 && i<cards1.count else { return }
            guard !cards1[i].isFlipped else { return }
                cards1[i].isFlipped = true
            if(cards1[i].backImage=="dog"){
                scorearray[(current+1)%2]+=1
                win=false
                showAllCards()
                return
            }
            flippedCards.append(i)
            scorearray[current]+=1
            changeplay()
            
            let nonmine=cards1.filter({$0.backImage != "dog"})
            if(flippedCards.count == nonmine.count){
                win=true
                showAllCards()
            }
            
        }
    func showAllCards() {
            for i in 0..<cards1.count {
                cards1[i].isFlipped = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                   self.gameEnds()
                   self.gameover = true
            }
    }
    func changeplay(){
        current=(current+1)%2;
    }
        func resetgame(){
            SetupGame(mode: mode)
        }
        func gameEnds(){
            if(win){
                winnertext1="It's a tie"
            }
            else if(scorearray[0]>scorearray[1]){
                winnertext1="Player 1 wins 🎉"
            }
            else {
                winnertext1="Player 2 wins 🎉"
            }
        }
    }
    

