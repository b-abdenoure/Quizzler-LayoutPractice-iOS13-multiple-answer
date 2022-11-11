
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        //this what i didn't understand, if its equal mean it == to boolean True
        if quizBrain.checkAnswer(userAnswer) == (sender.currentTitle != nil) {
            sender.backgroundColor = UIColor.green
        }
        // but if its not equal its mean its return false and its == to nil
        else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector (updateUI), userInfo: nil, repeats: false)
        
    }
    @objc func updateUI() {
        questionLabel.text = quizBrain.quiz [quizBrain.questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(quizBrain.questionNumber + 1) / Float(quizBrain.quiz.count)
        
    }
}

