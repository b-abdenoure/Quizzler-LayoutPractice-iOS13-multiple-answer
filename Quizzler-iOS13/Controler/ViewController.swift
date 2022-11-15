
import UIKit

class ViewController: UIViewController {
    
    /* progress bar visual object that help user to see progression*/
    @IBOutlet var progressBar: UIProgressView!
    /* label area for question asked*/
    @IBOutlet var questionLabel: UILabel!
    /* first button aswer*/
    @IBOutlet var answerOneLabel: UIButton!
    /* second button aswer*/
    @IBOutlet var answerTwoLabel: UIButton!
    /* third button aswer*/
    @IBOutlet var answerThreeLabel: UIButton!
    /* scrore label*/
    @IBOutlet var scoreLabel: UILabel!
    /* creation a new copy of the struct QuizBrain to be able to acces to properties*/
    var quizBrain = QuizBrain ()
    /* load of the first view when app is lunched*/
    override func viewDidLoad() {
        super.viewDidLoad()
        /*call the function responsible of refreching data on every load and every button pressed moment */
        updateUI()
    }
    /* includ all behavior of the app with the interation of user with the buttons pressed and update update the data of the view*/
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        //        let userAnswer = sender.titleLabel?.text ?? ""
        /* constant difine the atribut userAswer to the actual label text as an optional returned of the button pressed with force unwraping */
        let userAnswer = (sender.titleLabel?.text)!
        /* when button is pressed its compare the label text of the btton selected with the corrent answer from quiz brain struct data array */
        guard let userGotItRight = quizBrain.checkAnswer(userAnswer)else {
            return
        }
        /* add green color when the button pressed with label text match with to correnct answer */
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }
        /* turn the button in red whe the answer is not right*/
        else{
            sender.backgroundColor = UIColor.red
        }
        /* every moment button is pressed, the function jump to the next question or when the total of question answered, the count of question number back to 0 in otherwise case*/
        quizBrain.nextQuestion()
        /* give a little delai of 0.2sec to the color apreard on button pressed before it return to default clear background
         the function call a legacy code from objective-c with the "#selector" */
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector (updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI() {
        /* change the lablel of the app was loaded first and update every button pressed
         text insered is from the data from struct quizBrain.answer array form first position*/
        answerOneLabel?.setTitle("\(quizBrain.getAnswerOne())", for: .normal)
        /* change the lablel of the app was loaded first and update every button pressed
         text insered is from the data from struct quizBrain.answer array form second position*/
        answerTwoLabel?.setTitle("\(quizBrain.getAnswerTwo())", for: .normal)
        /* change the lablel of the app was loaded first and update every button pressed
         text insered is from the data from struct quizBrain.answer array form third position*/
        answerThreeLabel?.setTitle("\(quizBrain.getAnswerThree())", for: .normal)
        /* update the question label on first load and on every button pressed*/
        questionLabel.text = quizBrain.getQuestionText()
        /* return the background color to default clear every when button pressed */
        answerOneLabel.backgroundColor = UIColor.clear
        /* return the background color to default clear every when button pressed */
        answerTwoLabel.backgroundColor = UIColor.clear
        /* return the background color to default clear every when button pressed */
        answerThreeLabel.backgroundColor = UIColor.clear
        /* make progression bar update when button is pressed and increase depend of the nombers of question*/
        progressBar.progress = quizBrain.getProgress()
        /* update score every moment the user answer button pressed match the correnct answer of the correct answer on every question number reached and back tho 0 when the number of question have been answered*/
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
}

