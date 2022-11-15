import Foundation
/* structure to build data that compore all data for the app*/
struct QuizBrain {
    /* constant of the array with multi dimmentional level*/
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    /* reset the number of the question number called in first load and on evry button pressed moment*/
    var questionNumber: Int = 0
    /* reset the text label of score to zero in forst load*/
    var score = 0
    
    /* function that return boolean from comparaison of two string*/
    mutating func checkAnswer(_ userAnswer: String) -> Bool? {
        /* compare if the label text button pressed by user is equal to the data correct answer form the struct quiz*/
        if userAnswer == quiz[questionNumber].correctAnswerCheck {
            /* update the label text score when the right button is pressed*/
            score += 1
            return true
        }else{
            return false
        }
    }
    /* return the score integer updated on every update of checkAnswe function depending on the position in the scope*/
    func getScore() -> Int {
        return  score
    }
    /* return string data to the question label in the view, updated taking into account the update of question number reached*/
    func getQuestionText () -> String{
        return quiz[questionNumber].text
    }
    /* return string data to button label text one updated*/
    func getAnswerOne() -> String {
        return quiz[questionNumber].answer[0]
    }
    /* return string data to button label text two updated*/
    func getAnswerTwo() -> String {
        return quiz[questionNumber].answer[1]
    }
    /* return string data to button label text three updated*/
    func getAnswerThree() -> String {
        return quiz[questionNumber].answer[2]
    }
    /* return float value to make the profrass bage progressiong*/
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    /* making the jubp to the next question (text data from quiz) depending of the state of the question number, when question number reach the equal count of questions its reset to first array data of the quiz and rest the score for score label text*/
    mutating func nextQuestion() {
        /* compare betwen the count of question in the quiz with the state of the variable questionNumber integer +1 in its inferior to it*/
        if questionNumber + 1 < quiz.count {
            /* add +1 value to itself*/
            questionNumber += 1
        }
        /* otherwise it reset the state the variable questionNumber and score to = 0*/
        else {
            questionNumber = 0
            score = 0
        }
    }
    
}
