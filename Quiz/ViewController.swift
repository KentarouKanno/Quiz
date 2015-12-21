//
//  ViewController.swift
//  Quiz
//
//  Created by KentarOu on 2015/12/21.
//  Copyright © 2015年 KentarOu. All rights reserved.
//


import UIKit

struct Quiz {
    
    let question: String!
    let button1: String!
    let button2: String!
    let button3: String!
    let button4: String!
    let answerNum: Int!
}

class ViewController: UIViewController {
    
    @IBOutlet var QuestionLabel: UILabel!
    
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    @IBOutlet var Button4: UIButton!
    
    @IBOutlet var LabelEnd: UILabel!
    
    @IBOutlet var Next: UIButton!
    var CorrectAnswer = String()
    
    var arrayList:Array<Quiz> = []
    var nowQuiz: Quiz!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Hide()
        makeQuiz()
        nextQuiz()
    }
    
    func makeQuiz() {
        arrayList.append(Quiz(question: "質問1", button1: "質問1 Button1", button2: "質問1 Button2" , button3: "質問1 Button3", button4: "質問1 Button4", answerNum: 1))
        arrayList.append(Quiz(question: "質問2", button1: "質問2 Button1", button2: "質問2 Button2" , button3: "質問2 Button3", button4: "質問2 Button4", answerNum: 3))
        arrayList.append(Quiz(question: "質問3", button1: "質問3 Button1", button2: "質問3 Button2" , button3: "質問3 Button3", button4: "質問3 Button4", answerNum: 4))
        arrayList.append(Quiz(question: "質問4", button1: "質問4 Button1", button2: "質問4 Button2" , button3: "質問4 Button3", button4: "質問4 Button4", answerNum: 2))
        arrayList.append(Quiz(question: "質問5", button1: "質問5 Button1", button2: "質問5 Button2" , button3: "質問5 Button3", button4: "質問5 Button4", answerNum: 1))
        arrayList.append(Quiz(question: "質問6", button1: "質問6 Button1", button2: "質問6 Button2" , button3: "質問6 Button3", button4: "質問6 Button4", answerNum: 3))
        arrayList.append(Quiz(question: "質問7", button1: "質問7 Button1", button2: "質問7 Button2" , button3: "質問7 Button3", button4: "質問7 Button4", answerNum: 4))
        arrayList.shuffle(arrayList.count)
    }
    
    func nextQuiz() {
        
        if arrayList.count > 0 {
            nowQuiz = arrayList.removeFirst()
            
            QuestionLabel.text = nowQuiz.question
            Button1.setTitle(nowQuiz.button1, forState: UIControlState.Normal)
            Button2.setTitle(nowQuiz.button2, forState: UIControlState.Normal)
            Button3.setTitle(nowQuiz.button3, forState: UIControlState.Normal)
            Button4.setTitle(nowQuiz.button4, forState: UIControlState.Normal)
        } else {
            
            LabelEnd.hidden = false
            LabelEnd.text = "おわり..."
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func Hide(){
        LabelEnd.hidden = true
        Next.hidden = true
    }
    
    func UnHide(){
        LabelEnd.hidden = false
        Next.hidden = false
    }
    
    
    @IBAction func Button1Action(sender: UIButton) {
        UnHide()
        
        if (sender.tag == nowQuiz.answerNum) {
            LabelEnd.text = "正解だよ！"
        } else {
            LabelEnd.text = "ザンネーン!!"
        }
    }
    
    @IBAction func Next(sender: UIButton) {
        Hide()
        nextQuiz()
    }
}

extension Array {
    mutating func shuffle(count: Int) {
        for _ in 0..<count {
            self.sortInPlace{ (_,_) in arc4random() < arc4random() }
        }
    }
}



