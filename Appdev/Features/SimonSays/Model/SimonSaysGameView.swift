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
    private var isShowing:Bool = false
    @Published var gameOver:Bool = false
    private var currLevel:Int = 1
    @Published var winnertext:String = ""
    
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
        case .easy: number1 = 9
        case .medium: number1 = 16
        case .hard: number1 = 20
        }
       // let frontImage:"Cat"
        
        var images = Array(allImages.prefix(number1))
        
        
        images.shuffle()
        
        cardss = images.enumerated().map{index,image in
            Cards(front:"Cat", back:image)
        }
        player.removeAll()
        score=[0,0]
        currplayid=0
        gameOver=false
        chosenCards.removeAll()
        isShowing=false
        currLevel = 1
        
    }
    func iscardfipped(at Index:Int)->Bool{
        return player.contains(Index)
    }
    func newRound(){
        var canchoose=Array(0..<cardss.count)
        canchoose.removeAll{chosenCards.contains($0)}
        if(!canchoose.isEmpty){
            chosenCards.append(Int.random(in: 0..<canchoose.count))
        }
        
        player=[]
        isShowing=true
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(chosenCards.count) * 0.9){
            self.isShowing=false
        }
        
    }
    
    func playerTapped(_ index: Int) {
        guard !isShowing, !gameOver else{return}
        player.append(index)
        let currind=player.count - 1
        if(player[currind] != chosenCards[currind]){
            winner()
            gameOver=true
            return
        }
        if(player.count==chosenCards.count){
            score[currplayid]+=1
            currLevel+=1
            newRound()
            changeplayer()
        }
           
    }
    func winner(){
       
        if(score[0]>score[1]){
            return winnertext="Player 1 wins!"}
        else if(score[0]<score[1]){
            return winnertext="Player 2 wins!"
        }
        else{
            return winnertext="Tie!"
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
 
