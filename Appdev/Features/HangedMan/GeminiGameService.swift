//
//  GeminiGameService.swift
//  Appdev
//
//  Created by Prabhnoor Kaur on 08/09/25.
//



import SwiftUI
import GoogleGenerativeAI

class GeminiGameService: ObservableObject {
    private var model: GenerativeModel?
    
    init() {
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: Any],
           let apiKey = dict["GEMINI_API_KEY"] as? String, !apiKey.isEmpty {
            model = GenerativeModel(name: "gemini-1.5-flash", apiKey: apiKey)
        } else {
            model = nil
            #if DEBUG
            print("[GeminiGameService] GEMINI_API_KEY not found. Using fallback words.")
            #endif
        }

    }
    
   
    func generateWordWithHint(difficulty: GameDifficulty) async throws -> (word: String, hint: String) {
        let difficultyPrompt: String
        switch difficulty {
        case .easy:
            difficultyPrompt = "4-6 letters, common everyday words"
        case .medium:
            difficultyPrompt = "7-9 letters, moderately challenging words"
        case .hard:
            difficultyPrompt = "10+ letters, challenging but recognizable words"
        }

        
        let prompt = """
        Generate a random word for hangman with a helpful hint.
        
        Requirements:
        - Difficulty: \(difficultyPrompt)
        - Word should be a real, common word
        - No proper nouns
        - Give a helpful but not obvious hint
        
        Format your response exactly like this:
        WORD: [word in uppercase]
        HINT: [helpful hint in under 15 words]
        """
        
        guard let model = model else {
            return getFallbackWordWithHint(difficulty: difficulty)
        }
        let response = try await model.generateContent(prompt)
        guard let text = response.text else { throw GeminiError.invalidResponse }
        
        
        let lines = text.components(separatedBy: .newlines)
        var word = ""
        var hint = ""
        
        for line in lines {
            if line.hasPrefix("WORD:") {
                word = line.replacingOccurrences(of: "WORD:", with: "").trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            } else if line.hasPrefix("HINT:") {
                hint = line.replacingOccurrences(of: "HINT:", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }
        
       
        if word.isEmpty || hint.isEmpty {
            return getFallbackWordWithHint(difficulty: difficulty)
        }
        
        return (word: word, hint: hint)
    }
    
    private func getFallbackWordWithHint(difficulty: GameDifficulty) -> (word: String, hint: String) {
        switch difficulty {
        case .easy:
            let options = [
                ("apple", "Red or green fruit that keeps the doctor away"),
                ("house", "Place where people live"),
                ("water", "Clear liquid essential for life")
            ]
            return options.randomElement() ?? ("apple", "Red or green fruit")
        case .medium:
            let options = [
                ("computer", "Electronic device for processing data"),
                ("elephant", "Large animal with a trunk"),
                ("rainbow", "Colorful arc in the sky after rain")
            ]
            return options.randomElement() ?? ("computer", "Electronic device")
        case .hard:
            let options = [
                ("programming", "Writing code for computers"),
                ("architecture", "Design of buildings and structures"),
                ("mathematics", "Subject dealing with numbers and calculations")
            ]
            return options.randomElement() ?? ("programming", "Writing code")
        }
    }
}

enum GameDifficulty: String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

enum GeminiError: Error {
    case invalidResponse
    case networkError
}
