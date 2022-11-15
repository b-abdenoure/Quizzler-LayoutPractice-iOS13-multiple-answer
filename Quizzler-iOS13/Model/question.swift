import Foundation

/* difine propeties and parameters to the structure "question" used inside the "quiz" constant of the main structure "QuizBrain"*/
struct Question {
    let text: String
    let answer: [String] /* square braquet for array type*/
    let correctAnswerCheck: String
    /* initialisation of the struct modele with new human readable propreties for code understanding and refactoring*/
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        correctAnswerCheck = correctAnswer
    }
}
