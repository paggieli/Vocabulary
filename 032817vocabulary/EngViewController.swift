//
//  EngViewController.swift
//  032817vocabulary
//
//  Created by Admin on 2017/3/28.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit
import AVFoundation

class EngViewController: UIViewController {

    @IBOutlet weak var label_vocabulary: UILabel!    
    @IBOutlet weak var label_sentence: UILabel!
    
    var alphabet:String = ""
    var index = 0
    var array:[String] = []
    var is_Eng = true
    
    @IBAction func EngSpeak(_ sender: Any) {
        
        let utterance = AVSpeechUtterance(string: label_sentence.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
        
    }
    
    @IBAction func ChinSpeak(_ sender: Any) {
        
        let utterance = AVSpeechUtterance(string: label_sentence.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-tw")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
        
    }
    
    
    @IBAction func preBtn(_ sender: Any) {
        if(index == 0){
            index = 0
        }
        else{
          index -= 1
        }
        
        let line = array[index]
        let data = line.components(separatedBy: "\t")
        
        if is_Eng{
          label_vocabulary.text = data[0]
          label_sentence.text = data[2]
        }
        else{
            label_vocabulary.text = data[1]
            label_sentence.text = data[3]
        }
        
        label_vocabulary.alpha = 0
        label_sentence.alpha = 0
        
        let point = label_vocabulary.center
        label_vocabulary.center = CGPoint(x: -100, y: label_vocabulary.center.y)
        
        UIView.animate(withDuration: 1) {
            self.label_vocabulary.alpha = 1
            self.label_sentence.alpha = 1
            self.label_vocabulary.center = point
        }
        
    }
    
    
   
    @IBAction func nextBtn(_ sender: Any) {
        //print(index)
        if(index == array.count){
            index = 0
        }
        else{
            index += 1
        }
        
        let line = array[index]
        let data = line.components(separatedBy: "\t")
        if is_Eng{
            label_vocabulary.text = data[0]
            label_sentence.text = data[2]
        }
        else{
            label_vocabulary.text = data[1]
            label_sentence.text = data[3]
        }
        
        label_vocabulary.alpha = 0
        label_sentence.alpha = 0
        let point = label_vocabulary.center
        label_vocabulary.center = CGPoint(x: -100, y: label_vocabulary.center.y)
        
        UIView.animate(withDuration: 1) {
            self.label_vocabulary.alpha = 1
            self.label_sentence.alpha = 1
            self.label_vocabulary.center = point
        }
        
    }
    
    @IBAction func backToEng(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        if(alphabet == "A")
        {
          label_vocabulary.text = "Apple"
          label_sentence.text = "An apple a day keeps the doctor away."
        }
        else if(alphabet == "B")
        {
            label_vocabulary.text = "Food"
            label_sentence.text = "Food is everything"
        }
        */
        
        
        let path = Bundle.main.path(forResource: alphabet, ofType: "txt")
        
        let content = try! String(contentsOfFile: path!)
        array = content.components(separatedBy: "\n") //enter
        let array2 = array[index].components(separatedBy: "\t") //tab
        
        if self.is_Eng{
            label_vocabulary.text = array2[0]
            label_sentence.text = array2[2]
        }
        else{
            label_vocabulary.text = array2[1]
            label_sentence.text = array2[3]
        
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //print(segue.destination)
        let navController = segue.destination as! UINavigationController
        let controller = navController.viewControllers.first as! EngViewController
        controller.alphabet = self.alphabet
        controller.is_Eng = false
        controller.index = self.index

    }
    

}
