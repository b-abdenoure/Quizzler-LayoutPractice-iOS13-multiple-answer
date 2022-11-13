
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
        
        /*(1) here you're force unwrapping
         not the best way to do it
         you can use two ways :
         - let userAnswer = sender.titleLabel?.text ?? ""
         ( i do prefer using titleLabel, if it's nil, userAnswer will has a void string "" and checkAnswer will be always false)
         
         - guard let userAnswer = sender.currentTitle else {
             return
           }
         (this exit the func when current title is nil)
         
         
         */
        
        let userAnswer = sender.currentTitle!
        
        //this what i didn't understand, if its equal mean it == to boolean True
        
        /* (2)
         quizBrain.checkAnswer(userAnswer) gives us true or false,
         sender.currentTitle != nil will always be true because your buttons always has titles
           
         you're comparing the two, it's great when currentTitle isn't nil, but it's not the best way to do it
         
         you can just be sure that currentTitle isn't nil (comment 1) then do it simple here :
         
         if quizBrain.checkAnswer(userAnswer) {
         */
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

