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
    @Published var cards:[Card]=[]
    @Published var score:[Int]=[0,0]
    @Published var currplayid:Int=0
    private var player:[Int]=[]
    @Published var chosenCards:[Int]=[]
    private var mode:Difficultyy = .easy
    private var isShowing:Bool = false
    private var gameOver:Bool = false
    private var currLevel:Int = 1
    
    init(mode:Difficultyy = .easy){
        SetupGame(mode:mode)
    }
    
    func SetupGame(mode:Difficultyy){
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
        player.removeAll()
        score=[0,0]
        currplayid=0
        gameOver=false
        chosenCards.removeAll()
        isShowing=false
        currLevel = 1
        
    }
    func newRound(){
            chosenCards.append(Int.random(in: 0..<cards.count))
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
 
