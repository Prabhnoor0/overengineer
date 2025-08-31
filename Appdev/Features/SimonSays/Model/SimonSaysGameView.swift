//
//  SimonSaysGameView.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 29/08/25.
//

import SwiftUI

enum Difficultyy {
    case easy
    case medium
    case hard
}

class SimonSaysGameView: ObservableObject{
    @Published var cardss:[Cards]=[]
    @Published var score:[Int]=[0,0]
    @Published var currplayid:Int=0
    @Published var player:[Int]=[]
    @Published var chosenCards:[Int]=[]
    private var mode:Difficultyy = .easy
    @Published var isShowing:Bool = false
    @Published var gameOver:Bool = false
    private var currLevel:Int = 1
    @Published var winnertext:String = ""
    @Published var highlightedCard: Int? = nil
    @Published var highlighted: Int? = nil
    private var count:Int = 0
    
    init(mode:Difficultyy = .easy){
        SetupGame(mode:mode)
    }
    
    func SetupGame(mode:Difficultyy){
        self.mode=mode
        let allImages = [
            "cat1","cat2","cat3","cat4","cat5","cat6","cat7","cat8","cat9","cat10","cat11","cat12","cat13","cat14","cat15","cat16","cat17","cat18","cat19","cat20"
        ]
        
        let number1: Int
        switch mode {
        case .easy: number1 = 12
        case .medium: number1 = 16
        case .hard: number1 = 20
        }
       // let frontImage:"Cat"
        
        var images = Array(allImages.prefix(number1))
        
        
        images.shuffle()
        
        cardss = images.enumerated().map{index,image in
            Cards(image:image)
        }
        player.removeAll()
        score=[0,0]
        currplayid=0
        gameOver=false
        chosenCards.removeAll()
        isShowing=false
        currLevel = 1
        count=0
        
    }
    func newRound(){
        player.removeAll()
        count=0
            chosenCards.append(Int.random(in: 0..<cardss.count))
           isShowing=true
            highlight()
       
     
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(chosenCards.count) * 0.9){
            self.isShowing=false
        }
        
    }
    func highlight(){
        let index = 0
               highlightNextCard(index: index)
    }
    func highlightNextCard(index: Int){
        guard index < chosenCards.count else {return} 
               let cardIndex = chosenCards[index]
               highlightedCard = cardIndex
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                   self.highlightedCard = nil
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                       self.highlightNextCard(index: index + 1)
                   }
               }
    }
    func playerTapped(_ index: Int) {
        guard !isShowing, !gameOver else{return}
        highlighted = index
        player.append(index)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
               if self.highlighted == index {
                   self.highlighted = nil
               }
           }
        var curridused = count
        if(player[curridused] != chosenCards[curridused]){
            score[(currplayid+1)%2]+=1
            winner()
            gameOver=true
            return
        }
        else if(player == chosenCards){
            score[currplayid]+=1
            currLevel+=1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.changeplayer()
                self.newRound()
                }
           
        }
        else{
            count+=1
        }
           
    }
    func winner(){
        if(chosenCards.count==cardss.count){
            return winnertext="Tie!"
        }
        else if(score[0]>score[1]){
            return winnertext="Player 1 wins"
        }
       else{
            return winnertext="Player 2 wins"
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
 
