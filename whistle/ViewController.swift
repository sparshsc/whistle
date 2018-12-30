//
//  ViewController.swift
//  whistle
//
//  Created by Sparsh Chauhan on 12/11/18.
//  Copyright © 2018 Sparsh Chauhan. All rights reserved.
//

import UIKit
import AudioToolbox
import AVKit
import MapKit
import CoreLocation
//import Foundation
//import SwiftRequest
//import Alamofire


class ViewController: UIViewController {
    
    
    @IBAction func registrationdone(_ sender: Any) {
        
        UserDefaults.standard.set(true, forKey: "registrationdone")
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "tutorialstart") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func nowcanaskpermission(_ sender: Any) {
        UserDefaults.standard.set("true", forKey: "nowcanaskpermission")
    }
    
    @IBAction func ornowcanaskpermission(_ sender: Any) {
        UserDefaults.standard.set("true", forKey: "nowcanaskpermission")
        self.viewDidLoad()
    }
    
    @IBOutlet weak var nametextfield: UITextField!
    
    @IBAction func doneenteringname(_ sender: Any) {
        
        if (!(nametextfield.text!.isEmpty))
        {
            UserDefaults.standard.set(nametextfield.text!, forKey: "name")
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "questions") as UIViewController
            //sleep(1);
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    
    @IBOutlet weak var securityquestionsdisclaimer: UIButton!
    
    
    @IBOutlet weak var done2: UIButton!
    
    
    
    @IBOutlet weak var phonedonethree: UIButton!
    
    
    
    @IBOutlet weak var nextpageoutlet: UIButton!
    
    
    @IBOutlet weak var backtohomeoutlet: UIButton!
    
    
    
    @IBOutlet weak var securityquestionsonethanks: UIButton!
    
    @IBOutlet weak var securityquestionstwothanks: UIButton!
    
    
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()}
    
    
    
    @IBOutlet weak var firstanswer: UITextField!
    
    @IBOutlet weak var secondanswer: UITextField!
    
    
    
    @IBOutlet weak var firstphoneanswer: UITextField!
    
    @IBOutlet weak var secondphoneanswer: UITextField!
    
    @IBOutlet weak var thirdphoneanswer: UITextField!
    
    
    
    @IBOutlet weak var firstselectedquestion: UIButton!
    
    @IBOutlet weak var secondselectedquestion: UIButton!
    
    
    
    @IBOutlet weak var updatingphone1: UIButton!
    
    @IBOutlet weak var updatingphone2: UIButton!
    
    @IBOutlet weak var updatingphone3: UIButton!
    
    
    
    @IBOutlet weak var updatingphone1textfield: UITextField!
    
    @IBOutlet weak var doneupdatingphone1textfield: UIButton!
    
    //@IBOutlet weak var backafterupdatingphone1: UIButton!
    
    @IBOutlet weak var thanksafterupdatingphone1: UIButton!
    
    
    
    @IBOutlet weak var updatingphone2textfield: UITextField!
    
    @IBOutlet weak var doneupdatingphone2textfield: UIButton!
    
    //@IBOutlet weak var backafterupdatingphone2: UIButton!
    
    @IBOutlet weak var thanksafterupdatingphone2: UIButton!
    
    
    
    @IBOutlet weak var updatingphone3textfield: UITextField!
    
    @IBOutlet weak var doneupdatingphone3textfield: UIButton!
    
    //@IBOutlet weak var backafterupdatingphone3: UIButton!
    
    @IBOutlet weak var thanksafterupdatingphone3: UIButton!
    
    
    
    
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    let regionInMeters: Double = 50
    
    @IBOutlet weak var settingsbutton: UIButton!
    
    @IBOutlet weak var recenteringlabel: UIButton!
    
    @IBOutlet weak var pleaserefresh: UIButton!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var pin: UIImageView!
    
    @IBOutlet weak var refreshmapbutton: UIButton!
    
    @IBOutlet weak var informationalrefreshesevery12label: UILabel!
    
    @IBOutlet weak var godirectionsbutton: UIButton!
    
    var directionsArray: [MKDirections] = []
    
    @IBOutlet weak var resetdirectionsbutton: UIButton!
    
    @IBOutlet weak var directionstepsbutton: UIButton!
    
    @IBOutlet weak var etalabel: UIButton!
    
    
    
    
    @IBOutlet weak var silentsosbutton: UIButton!
    
    @IBOutlet weak var cancelsilentsosbutton: UIButton!
    
    @IBOutlet weak var mainsosbutton: UIButton!
    
    //var timer = Timer()
    //var timer: Timer? = Timer()
    weak var timer: Timer?
    
    @IBOutlet weak var timerlabel: UILabel!
    
    
    
    
    @IBOutlet weak var cancelsilentalarmfirstsecurityquestionlabel: UILabel!
    
    @IBOutlet weak var cancelsilentalarmsecondsecurityquestionlabel: UILabel!
    
    @IBOutlet weak var cancelsilentalarmfirstsecurityquestiontextfield: UITextField!
    
    @IBOutlet weak var cancelsilentalarmsecondsecurityquestiontextfield: UITextField!
    
    @IBOutlet weak var cancelsilentalarmdonebutton: UIButton!
    
    
    
    
    @IBOutlet weak var firstmainsosmessagelabel: UILabel!
    
    @IBOutlet weak var secondmainsosmessagelabel: UILabel!
    
    @IBOutlet weak var thirdmainsosmessagelabel: UILabel!
    
    
    
    
    struct GlobalVariable{
        static var firstSecurityQuestionsAnswer=""
        static var secondSecurityQuestionsAnswer=""
        static var firstSecurityQuestion="";
        static var secondSecurityQuestion="";
        static var firstPhoneNumber=0;
        static var secondPhoneNumber=0;
        static var thirdPhoneNumber=0;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstmainsosmessagelabel?.isHidden = true
        secondmainsosmessagelabel?.isHidden = true
        thirdmainsosmessagelabel?.isHidden = true
        
        if (!(UserDefaults.standard.object(forKey: "registrationdone") == nil) && !(String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestion")) == "nil") && !(String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestion")) == "nil") && !(String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestionsAnswer")) == "nil") && !(String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestionsAnswer")) == "nil") && !(String(describing: UserDefaults.standard.object(forKey: "firstPhoneNumber")) == "nil") && !(String(describing: UserDefaults.standard.object(forKey: "secondPhoneNumber")) == "nil") && !(String(describing: UserDefaults.standard.object(forKey: "thirdPhoneNumber")) == "nil") && !(String(describing: UserDefaults.standard.object(forKey: "nowcanaskpermission")) == "nil"))
        {
            //sleep(1);
            
            checkLocationServices()
            
        }
        
        var question1 = String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestion"))
        question1 = question1.replacingOccurrences(of: "Optional(", with: "")
        question1 = question1.replacingOccurrences(of: ")", with: "")
        question1 = question1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one.")
        cancelsilentalarmfirstsecurityquestionlabel?.text = question1
        
        var question2 = String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestion"))
        question2 = question2.replacingOccurrences(of: "Optional(", with: "")
        question2 = question2.replacingOccurrences(of: ")", with: "")
        question2 = question2.replacingOccurrences(of: "nil", with: "not selected yet, please pick one.")
        cancelsilentalarmsecondsecurityquestionlabel?.text = question2
        
        if (UserDefaults.standard.integer(forKey: "silentsostriggered") == 0)
        {
            
            timer?.invalidate()
            timer = nil
            timerlabel?.text = ""
            
            UserDefaults.standard.set(180, forKey: "timer")
            
            cancelsilentsosbutton?.isHidden = true
            silentsosbutton?.isHidden = false
        }
        else
        {
            if ((UserDefaults.standard.integer(forKey: "timer") < 180) && (UserDefaults.standard.integer(forKey: "timer") > 1))
            {
                print("hello")
                timer?.invalidate()
                timer = nil
            }
            
            silentsospressed(true)
        }
        
        let updatephonebutton1 = updatingphone1
        var text1 = String(describing: UserDefaults.standard.object(forKey: "firstPhoneNumber"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "No phone # entered yet")
        updatephonebutton1?.setTitle(text1, for: .normal)
        
        let updatephonebutton2 = updatingphone2
        text1 = String(describing: UserDefaults.standard.object(forKey: "secondPhoneNumber"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "No phone # entered yet")
        updatephonebutton2?.setTitle(text1, for: .normal)
        
        let updatephonebutton3 = updatingphone3
        text1 = String(describing: UserDefaults.standard.object(forKey: "thirdPhoneNumber"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "No phone # entered yet")
        updatephonebutton3?.setTitle(text1, for: .normal)
        
        let button4 = firstselectedquestion
        text1 = String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestion"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one above.")
        
        button4?.setTitle("First Security Question is " + text1, for: .normal)
        
        let button5 = secondselectedquestion
        text1 = String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestion"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one above.")
        button5?.setTitle("Second Security Question is " + text1, for: .normal)
        
        let directionsbutton = godirectionsbutton
        directionsbutton?.layer.cornerRadius = (directionsbutton?.frame.size.width)!/2
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func donewsecondanswer(_ sender: Any) {
        
        GlobalVariable.firstSecurityQuestionsAnswer=firstanswer.text!
        UserDefaults.standard.set(GlobalVariable.firstSecurityQuestionsAnswer, forKey: "firstSecurityQuestionsAnswer")
        GlobalVariable.secondSecurityQuestionsAnswer=secondanswer.text!
        UserDefaults.standard.set(GlobalVariable.secondSecurityQuestionsAnswer, forKey: "secondSecurityQuestionsAnswer")
        
        dismissKeyboard()
        
        if (!(GlobalVariable.firstSecurityQuestionsAnswer.isEmpty) && !(GlobalVariable.secondSecurityQuestionsAnswer.isEmpty)){
            
            let button = nextpageoutlet
            button?.setTitleColor(.white, for: .normal)
            //button?.setTitle("Test Button", for: .normal)
            //button?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
            let button2 = securityquestionsdisclaimer
            button2?.setTitle("", for: .normal)
            
            let button3 = done2
            button3?.setTitle("Thanks!", for: .normal)
            button3?.setTitleColor(.yellow, for: .normal)
            
            //self.view.addSubview(button!)
        }
        
    }
    
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    @IBAction func donewthirdphoneanswer(_ sender: Any) {
     
        if (!(firstphoneanswer.text!.isEmpty) && !(secondphoneanswer.text!.isEmpty) && !(thirdphoneanswer.text!.isEmpty) && isStringAnInt(string: firstphoneanswer.text!) && isStringAnInt(string: secondphoneanswer.text!) && isStringAnInt(string: thirdphoneanswer.text!))
        {
            if ((firstphoneanswer.text!.count==10) && (secondphoneanswer.text!.count==10) && (thirdphoneanswer.text!.count==10))
            {
                
                dismissKeyboard()
            GlobalVariable.firstPhoneNumber=Int(firstphoneanswer.text!)!
            GlobalVariable.secondPhoneNumber=Int(secondphoneanswer.text!)!
            GlobalVariable.thirdPhoneNumber=Int(thirdphoneanswer.text!)!
            UserDefaults.standard.set(GlobalVariable.firstPhoneNumber, forKey: "firstPhoneNumber")
            UserDefaults.standard.set(GlobalVariable.secondPhoneNumber, forKey: "secondPhoneNumber")
            UserDefaults.standard.set(GlobalVariable.thirdPhoneNumber, forKey: "thirdPhoneNumber")
            
                let button = backtohomeoutlet
                button?.setTitleColor(.white, for: .normal)
                
                let button2 = phonedonethree
                button2?.setTitle("", for: .normal)
            }
            
        }
        
    }
    
    @IBAction func changedfirstphoneanswer(_ sender: Any) {
        
        if ( !(updatingphone1textfield.text!.isEmpty) && isStringAnInt(string: updatingphone1textfield.text!) )
        {
            if ((updatingphone1textfield.text!.count==10))
            {
                dismissKeyboard()
            GlobalVariable.firstPhoneNumber=Int(updatingphone1textfield.text!)!
            UserDefaults.standard.set(GlobalVariable.firstPhoneNumber, forKey: "firstPhoneNumber")
                
                //let button = backafterupdatingphone1
                //button?.setTitleColor(.yellow, for: .normal)
                
                let button2 = doneupdatingphone1textfield
                button2?.setTitle("", for: .normal)
                
                let button3 = thanksafterupdatingphone1
                button3?.setTitleColor(.white, for: .normal)
            }
            
        }
        
    }
    
    @IBAction func changedsecondphoneanswer(_ sender: Any) {
        
        if ( !(updatingphone2textfield.text!.isEmpty) && isStringAnInt(string: updatingphone2textfield.text!) )
        {
            if ((updatingphone2textfield.text!.count==10))
            {
                dismissKeyboard()
            GlobalVariable.secondPhoneNumber=Int(updatingphone2textfield.text!)!
            UserDefaults.standard.set(GlobalVariable.secondPhoneNumber, forKey: "secondPhoneNumber")
                
                //let button = backafterupdatingphone2
                //button?.setTitleColor(.yellow, for: .normal)
                
                let button2 = doneupdatingphone2textfield
                button2?.setTitle("", for: .normal)
                
                let button3 = thanksafterupdatingphone2
                button3?.setTitleColor(.white, for: .normal)
            }
            
        }
    }
    
    @IBAction func changedthirdphoneanswer(_ sender: Any) {
        
        if ( !(updatingphone3textfield.text!.isEmpty) && isStringAnInt(string: updatingphone3textfield.text!) )
        {
            if ((updatingphone3textfield.text!.count==10))
            {
                dismissKeyboard()
                GlobalVariable.thirdPhoneNumber=Int(updatingphone3textfield.text!)!
                UserDefaults.standard.set(GlobalVariable.thirdPhoneNumber, forKey: "thirdPhoneNumber")
                
                //let button = backafterupdatingphone3
                //button?.setTitleColor(.yellow, for: .normal)
                
                let button2 = doneupdatingphone3textfield
                button2?.setTitle("", for: .normal)
                
                let button3 = thanksafterupdatingphone3
                button3?.setTitleColor(.white, for: .normal)
            }
            
        }
        
    }
    
    /*@objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }*/
    
    func setPlaceholderColor(textField: UITextField, placeholderText: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    
    @IBAction func zipcodeQuestion(sender: AnyObject) {
        
        GlobalVariable.firstSecurityQuestion="What is your home's zipcode?"
        UserDefaults.standard.set(GlobalVariable.firstSecurityQuestion, forKey: "firstSecurityQuestion")
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let button = securityquestionsonethanks
        let button2 = securityquestionstwothanks
        
        button?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        button2?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        
        button?.setTitleColor(.blue, for: .normal)
        button2?.setTitleColor(.blue, for: .normal)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "questions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)    
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()
        
    }
    
    @IBAction func firstPetNameQuestion(sender: AnyObject) {
        
        GlobalVariable.firstSecurityQuestion="What is your first pet's name?"
        UserDefaults.standard.set(GlobalVariable.firstSecurityQuestion, forKey: "firstSecurityQuestion")
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let button = securityquestionsonethanks
        let button2 = securityquestionstwothanks
        
        button?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        button2?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        
        button?.setTitleColor(.blue, for: .normal)
        button2?.setTitleColor(.blue, for: .normal)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "questions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()
        
    }
    
    @IBAction func cityThirdGradeQuestion(sender: AnyObject) {
        
        GlobalVariable.firstSecurityQuestion="In what city did you live in 3rd grade?"
        UserDefaults.standard.set(GlobalVariable.firstSecurityQuestion, forKey: "firstSecurityQuestion")
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let button = securityquestionsonethanks
        let button2 = securityquestionstwothanks
        
        button?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        button2?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        
        button?.setTitleColor(.blue, for: .normal)
        button2?.setTitleColor(.blue, for: .normal)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "questions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()
        
    }
    
    @IBAction func siblingCityQuestion(sender: AnyObject) {
        
        GlobalVariable.secondSecurityQuestion="In what city does your oldest sibling live in?"
        UserDefaults.standard.set(GlobalVariable.secondSecurityQuestion, forKey: "secondSecurityQuestion")
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let button = securityquestionsonethanks
        let button2 = securityquestionstwothanks
        
        button?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        button2?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        
        button?.setTitleColor(.blue, for: .normal)
        button2?.setTitleColor(.blue, for: .normal)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "questions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()
        
    }
    
    @IBAction func birthdayMonthOldestSibling(sender: AnyObject) {
        
        GlobalVariable.secondSecurityQuestion="What month was your oldest sibling born in?"
        UserDefaults.standard.set(GlobalVariable.secondSecurityQuestion, forKey: "secondSecurityQuestion")
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let button = securityquestionsonethanks
        let button2 = securityquestionstwothanks
        
        button?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        button2?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        
        button?.setTitleColor(.blue, for: .normal)
        button2?.setTitleColor(.blue, for: .normal)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "questions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()
        
    }
    
    @IBAction func birthdayMonthMom(sender: AnyObject) {
        
        GlobalVariable.secondSecurityQuestion="What month is your mom's birthday in?"
        UserDefaults.standard.set(GlobalVariable.secondSecurityQuestion, forKey: "secondSecurityQuestion")
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let button = securityquestionsonethanks
        let button2 = securityquestionstwothanks
        
        button?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        button2?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        
        button?.setTitleColor(.blue, for: .normal)
        button2?.setTitleColor(.blue, for: .normal)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "questions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()
        
    }
    
    @IBAction func updatingzipcodeQuestion(sender: AnyObject) {
        
        GlobalVariable.firstSecurityQuestion="What is your home's zipcode?"
        UserDefaults.standard.set(GlobalVariable.firstSecurityQuestion, forKey: "firstSecurityQuestion")
        
        let button4 = firstselectedquestion
        var text1 = String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestion"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one above.")
        
        button4?.setTitle("First Security Question is " + text1, for: .normal)
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let button = securityquestionsonethanks
        //let button2 = securityquestionstwothanks
        
        button?.setTitle("Thanks!", for: .normal)
        
        //button2?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        
        //button?.setTitleColor(.blue, for: .normal)
        //button2?.setTitleColor(.blue, for: .normal)
        
        /*let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "updatingquestions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()*/
        
    }
    
    @IBAction func updatingfirstPetNameQuestion(sender: AnyObject) {
        
        GlobalVariable.firstSecurityQuestion="What is your first pet's name?"
        UserDefaults.standard.set(GlobalVariable.firstSecurityQuestion, forKey: "firstSecurityQuestion")
        
        let button4 = firstselectedquestion
        var text1 = String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestion"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one above.")
        
        button4?.setTitle("First Security Question is " + text1, for: .normal)
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let button = securityquestionsonethanks
        //let button2 = securityquestionstwothanks
        
        button?.setTitle("Thanks!", for: .normal)
        //button2?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        
        //button?.setTitleColor(.blue, for: .normal)
        //button2?.setTitleColor(.blue, for: .normal)
        
        /*let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "updatingquestions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()*/
        
    }
    
    @IBAction func updatingcityThirdGradeQuestion(sender: AnyObject) {
        
        GlobalVariable.firstSecurityQuestion="In what city did you live in 3rd grade?"
        UserDefaults.standard.set(GlobalVariable.firstSecurityQuestion, forKey: "firstSecurityQuestion")
        
        let button4 = firstselectedquestion
        var text1 = String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestion"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one above.")
        
        button4?.setTitle("First Security Question is " + text1, for: .normal)
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let button = securityquestionsonethanks
        //let button2 = securityquestionstwothanks
        
        button?.setTitle("Thanks!", for: .normal)
        //button2?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        
        //button?.setTitleColor(.blue, for: .normal)
        //button2?.setTitleColor(.blue, for: .normal)
        
        /*let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "updatingquestions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()*/
        
    }
    
    @IBAction func updatingsiblingCityQuestion(sender: AnyObject) {
        
        GlobalVariable.secondSecurityQuestion="In what city does your oldest sibling live in?"
        UserDefaults.standard.set(GlobalVariable.secondSecurityQuestion, forKey: "secondSecurityQuestion")
        
        let button4 = secondselectedquestion
        var text1 = String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestion"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one above.")
        
        button4?.setTitle("Second Security Question is " + text1, for: .normal)
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        //let button = securityquestionsonethanks
        let button2 = securityquestionstwothanks
        
        //button?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        button2?.setTitle("Thanks!", for: .normal)
        
        //button?.setTitleColor(.blue, for: .normal)
        //button2?.setTitleColor(.blue, for: .normal)
        
        /*let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "updatingquestions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()*/
        
    }
    
    @IBAction func updatingbirthdayMonthOldestSibling(sender: AnyObject) {
        
        GlobalVariable.secondSecurityQuestion="What month was your oldest sibling born in?"
        UserDefaults.standard.set(GlobalVariable.secondSecurityQuestion, forKey: "secondSecurityQuestion")
        
        let button4 = secondselectedquestion
        var text1 = String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestion"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one above.")
        
        button4?.setTitle("Second Security Question is " + text1, for: .normal)
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        //let button = securityquestionsonethanks
        let button2 = securityquestionstwothanks
        
        //button?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        button2?.setTitle("Thanks!", for: .normal)
        
       // button?.setTitleColor(.blue, for: .normal)
        //button2?.setTitleColor(.blue, for: .normal)
        
        /*let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "updatingquestions") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()*/
        
    }
    
    @IBAction func updatingbirthdayMonthMom(sender: AnyObject) {
        
        GlobalVariable.secondSecurityQuestion="What month is your mom's birthday in?"
        UserDefaults.standard.set(GlobalVariable.secondSecurityQuestion, forKey: "secondSecurityQuestion")
        
        let button4 = secondselectedquestion
        var text1 = String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestion"))
        text1 = text1.replacingOccurrences(of: "Optional(", with: "")
        text1 = text1.replacingOccurrences(of: ")", with: "")
        text1 = text1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one above.")
        
        button4?.setTitle("Second Security Question is " + text1, for: .normal)
        
        //sleep(1);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        //let button = securityquestionsonethanks
        let button2 = securityquestionstwothanks
        
        //button?.setTitleColor(.white, for: [.normal,.highlighted,.disabled,.selected,.focused,.application,.reserved])
        button2?.setTitle("Thanks!", for: .normal)
        
        //button?.setTitleColor(.blue, for: .normal)
        //button2?.setTitleColor(.blue, for: .normal)
        
        /*let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "updatingquestions") as UIViewController
        self.present(vc, animated: true, completion: nil)
        //self.window!.rootViewController = viewcontroller
        //self.window!.makeKeyAndVisible()*/
        
    }
    
    func turnonloc() {
        
        mapView.widthAnchor.constraint(equalToConstant: 0).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        let tempsettingsbutton = settingsbutton
        tempsettingsbutton?.setTitle("", for: .normal)
        tempsettingsbutton?.widthAnchor.constraint(equalToConstant: 0).isActive = true
        
        let turnonloclabel = recenteringlabel
        turnonloclabel?.setTitle("Click here to open settings to allow Location for whistle.", for: .normal)
        //turnonloclabel?.setTitleColor(.white, for: .normal)
        turnonloclabel?.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        
        let refreshlabel = pleaserefresh
        refreshlabel?.setTitle("Please refresh the running app after allowing Location.", for: .normal)
        
        let temppin = pin
        temppin?.widthAnchor.constraint(equalToConstant: 0).isActive = true
        temppin?.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        let temprefreshbutton = refreshmapbutton
        temprefreshbutton?.widthAnchor.constraint(equalToConstant: 0).isActive = true
        
        let tempinformationalrefreshesevery12label = informationalrefreshesevery12label
        tempinformationalrefreshesevery12label?.widthAnchor.constraint(equalToConstant: 0).isActive = true
    
    }
    
    @objc func openSettings(sender: UIButton!) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {               //CENTERS THE MAP ON THE USER's LOCATION
        if let location = locationManager.location?.coordinate
        {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView?.setRegion(region, animated: true)
        }
    }
    
    @IBAction func centermapbutton(_ sender: Any) {
        centerViewOnUserLocation()
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }
        else
        {
            turnonloc()
        }
    }
    
    func checkLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
            
        case .authorizedWhenInUse:
            
            startTrackingUserLocation()
            
        case .denied:
            print("denied");
            
                turnonloc()
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            print("restricted");
            
                turnonloc()
            
        case .authorizedAlways:
            print("authorizedAlways");
            
                turnonloc()
            
        }
        
    }
    
    func startTrackingUserLocation() {
        centerViewOnUserLocation()
        //previousLocation = getCenterLocation(for: mapView)
    
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(12), execute: {
            let center = CLLocationCoordinate2D(latitude: self.locationManager.location?.coordinate.latitude ?? 0, longitude: self.locationManager.location?.coordinate.longitude ?? 0)
            let region = MKCoordinateRegion.init(center: center, latitudinalMeters: self.regionInMeters, longitudinalMeters: self.regionInMeters)
            self.mapView?.setRegion(region, animated: true)
            self.checkLocationAuthorization()
        })
        
        
        //locationManager.startUpdatingLocation()
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func getDirections() {
        guard let location = locationManager.location?.coordinate else {
            turnonloc()
            return
        }
        
        let request = createDirectionsRequest(from: location)
        let directions = MKDirections(request: request)
        resetMapView(withNew: directions)
        
        directions.calculate { [unowned self] (response, error) in
            //TODO: Handle error if needed
            guard let response = response else { return } //TODO: Show response not available in an alert
            
            for route in response.routes {
                
                var stepArray = [String]()
                if (!(UserDefaults.standard.object(forKey: "stepsarray") == nil))
                {
                    stepArray = UserDefaults.standard.object(forKey: "stepsarray") as! [String]
                    stepArray.removeAll()
                }
                
                var expectedtraveltime = route.expectedTravelTime
                expectedtraveltime = expectedtraveltime/60
                expectedtraveltime = Double(floor(100*expectedtraveltime)/100)
                let tempetabutton = self.etalabel
                tempetabutton?.setTitle("ETA: \(expectedtraveltime) min", for: .normal)
                
                
                let steps = route.steps
                for object in steps {
                    
                    var tempinstructions = " In \(object.distance) ft. \(object.instructions). "
                    tempinstructions = tempinstructions.replacingOccurrences(of: ".0", with: "")
                    tempinstructions = tempinstructions.replacingOccurrences(of: "Turn", with: "turn")
                    tempinstructions = tempinstructions.replacingOccurrences(of: "ft. .", with: "")
                    
                    stepArray.append(tempinstructions)
                    print(tempinstructions)
                    
                }
                
                //if (!(stepArray.isEmpty))
                //{
                    UserDefaults.standard.set(stepArray, forKey: "stepsarray")
                //}
                
                
                
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    self.centerViewOnUserLocation()
                })
            }
        }
    }
    
    
    func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let destinationCoordinate       = getCenterLocation(for: mapView).coordinate
        let startingLocation            = MKPlacemark(coordinate: coordinate)
        let destination                 = MKPlacemark(coordinate: destinationCoordinate)
        
        let request                     = MKDirections.Request()
        request.source                  = MKMapItem(placemark: startingLocation)
        request.destination             = MKMapItem(placemark: destination)
        
        var transporttype = String(describing: (UserDefaults.standard.object(forKey: "directionswalkingordriving")))
        transporttype = transporttype.replacingOccurrences(of: "Optional(", with: "")
        transporttype = transporttype.replacingOccurrences(of: ")", with: "")
        print(transporttype)
        
        if (transporttype == "walking")
        {
            request.transportType = .walking
        }
        else
        {
            request.transportType = .automobile
        }
        
        request.requestsAlternateRoutes = true
        
        return request
    }
    
    
    
    func resetMapView(withNew directions: MKDirections) {
        mapView.removeOverlays(mapView.overlays)
        let _ = directionsArray.map { $0.cancel() }
        directionsArray.append(directions)
        
    }
    
    
    @IBAction func resetdirections(_ sender: Any) {
        resetMap()
        centerViewOnUserLocation()
        
        let tempresetdirectionsbutton = resetdirectionsbutton
        tempresetdirectionsbutton?.setTitle("", for: .normal)
        
        let tempdirectionsbutton = directionstepsbutton
        tempdirectionsbutton?.setTitle("", for: .normal)
        
        let tempetabutton = self.etalabel
        tempetabutton?.setTitle("", for: .normal)
    }
    
    func resetMap() {
        mapView.removeOverlays(mapView.overlays)
    }
    
    
    
    
    @IBAction func goButtonTapped(_ sender: Any) {
        
        getDirections()
    
        let tempresetdirectionsbutton = resetdirectionsbutton
        tempresetdirectionsbutton?.setTitle("Reset Directions", for: .normal)
        
        let tempdirectionsbutton = directionstepsbutton
        tempdirectionsbutton?.setTitle("Direction Steps", for: .normal)
        
    }
    
    
    
    
    
    @objc func timeraction()
    {
        var temptimer = UserDefaults.standard.integer(forKey: "timer")
        temptimer = temptimer - 1
        UserDefaults.standard.set(temptimer, forKey: "timer")
        
        if (temptimer > 0)
        {
            timerlabel?.text = "\(UserDefaults.standard.integer(forKey: "timer")) seconds"
            
            if (temptimer == 150)
            {
                
                 print("Starting...")
                 var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
                 var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
                 //Note replace + = %2B , for To and From phone number
                 var fromNumber = "%2B17727743493"// actual number is +9999999
                 var toNumber = "%2B14088391663"// actual number is +9999999
                 var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation"))"
                 
                 message = message.replacingOccurrences(of: "Optional(", with: "")
                 message = message.replacingOccurrences(of: ")", with: "")
                 message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
                 
                 // Build the request
                 var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
                 request.httpMethod = "POST"
                 request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
                 
                 // Build the completion block and send the request
                 URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                 print("Finished")
                 if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                 // Success
                 print("Response: \(responseDetails)")
                 } else {
                 // Failure
                 print("Error: \(error)")
                 }
                 }).resume()
                
                
            }
            if (temptimer == 120)
            {
                /*
                 print("Starting...")
                 var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
                 var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
                 //Note replace + = %2B , for To and From phone number
                 var fromNumber = "%2B17727743493"// actual number is +9999999
                 var toNumber = "%2B14088391663"// actual number is +9999999
                 var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation"))"
                 
                 message = message.replacingOccurrences(of: "Optional(", with: "")
                 message = message.replacingOccurrences(of: ")", with: "")
                 message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
                 
                 // Build the request
                 var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
                 request.httpMethod = "POST"
                 request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
                 
                 // Build the completion block and send the request
                 URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                 print("Finished")
                 if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                 // Success
                 print("Response: \(responseDetails)")
                 } else {
                 // Failure
                 print("Error: \(error)")
                 }
                 }).resume()
                 */
            }
            if (temptimer == 90)
            {
                /*
                 print("Starting...")
                 var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
                 var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
                 //Note replace + = %2B , for To and From phone number
                 var fromNumber = "%2B17727743493"// actual number is +9999999
                 var toNumber = "%2B14088391663"// actual number is +9999999
                 var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation"))"
                 
                 message = message.replacingOccurrences(of: "Optional(", with: "")
                 message = message.replacingOccurrences(of: ")", with: "")
                 message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
                 
                 
                 
                 
                 // Build the request
                 var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
                 request.httpMethod = "POST"
                 request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
                 
                 // Build the completion block and send the request
                 URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                 print("Finished")
                 if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                 // Success
                 print("Response: \(responseDetails)")
                 } else {
                 // Failure
                 print("Error: \(error)")
                 }
                 }).resume()
                 */
            }
            if (temptimer == 60)
            {
                /*
                 print("Starting...")
                 var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
                 var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
                 //Note replace + = %2B , for To and From phone number
                 var fromNumber = "%2B17727743493"// actual number is +9999999
                 var toNumber = "%2B14088391663"// actual number is +9999999
                 var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation"))"
                 
                 message = message.replacingOccurrences(of: "Optional(", with: "")
                 message = message.replacingOccurrences(of: ")", with: "")
                 message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
                 
                 // Build the request
                 var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
                 request.httpMethod = "POST"
                 request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
                 
                 // Build the completion block and send the request
                 URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                 print("Finished")
                 if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                 // Success
                 print("Response: \(responseDetails)")
                 } else {
                 // Failure
                 print("Error: \(error)")
                 }
                 }).resume()
                 */
            }
            if (temptimer == 30)
            {
                /*
                 print("Starting...")
                 var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
                 var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
                 //Note replace + = %2B , for To and From phone number
                 var fromNumber = "%2B17727743493"// actual number is +9999999
                 var toNumber = "%2B14088391663"// actual number is +9999999
                 var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation"))"
                 
                 message = message.replacingOccurrences(of: "Optional(", with: "")
                 message = message.replacingOccurrences(of: ")", with: "")
                 message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
                 
                 // Build the request
                 var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
                 request.httpMethod = "POST"
                 request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
                 
                 // Build the completion block and send the request
                 URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                 print("Finished")
                 if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                 // Success
                 print("Response: \(responseDetails)")
                 } else {
                 // Failure
                 print("Error: \(error)")
                 }
                 }).resume()
                 */
            }
        }
        else
        {
            if (timer != nil)
            {
                timer?.invalidate()
                timer = nil
            }
            
            
            thirdmainsosmessagelabel?.isHidden = false
            
            /*  TEXTS CAMPUS SAFETY WITH LOCATION AND TELLS THEM TO TELL COPS
             
             print("Starting...")
             var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
             var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
             //Note replace + = %2B , for To and From phone number
             var fromNumber = "%2B17727743493"// actual number is +9999999
             var toNumber = "%2B14088391663"// actual number is +9999999
             var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation")) please send your forces there and also send the police there"
             
             message = message.replacingOccurrences(of: "Optional(", with: "")
             message = message.replacingOccurrences(of: ")", with: "")
             message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
             
             // Build the request
             var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
             request.httpMethod = "POST"
             request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
             
             // Build the completion block and send the request
             URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
             print("Finished")
             if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
             // Success
             print("Response: \(responseDetails)")
             } else {
             // Failure
             print("Error: \(error)")
             }
             }).resume()
             */
            
            
            //UserDefaults.standard.set(0, forKey: "silentsostriggered")
            
            
            /*  TEXTS EMERGENCY CONTACT 1 WITH LOCATION AND SAYS TIMER RUN OUT AND TELLS THEM TO TELL COPS AND COME THEMSELVES
             
             print("Starting...")
             var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
             var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
             //Note replace + = %2B , for To and From phone number
             var fromNumber = "%2B17727743493"// actual number is +9999999
             var toNumber = "%2B14088391663"// actual number is +9999999
             var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation")) please send your forces there and also send the police there"
             
             message = message.replacingOccurrences(of: "Optional(", with: "")
             message = message.replacingOccurrences(of: ")", with: "")
             message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
             
             // Build the request
             var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
             request.httpMethod = "POST"
             request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
             
             // Build the completion block and send the request
             URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
             print("Finished")
             if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
             // Success
             print("Response: \(responseDetails)")
             } else {
             // Failure
             print("Error: \(error)")
             }
             }).resume()
             */
            
            
            /*  TEXTS EMERGENCY CONTACT 2 WITH LOCATION AND SAYS TIMER RUN OUT AND TELLS THEM TO TELL COPS AND COME THEMSELVES
             
             print("Starting...")
             var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
             var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
             //Note replace + = %2B , for To and From phone number
             var fromNumber = "%2B17727743493"// actual number is +9999999
             var toNumber = "%2B14088391663"// actual number is +9999999
             var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation")) please send your forces there and also send the police there"
             
             message = message.replacingOccurrences(of: "Optional(", with: "")
             message = message.replacingOccurrences(of: ")", with: "")
             message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
             
             // Build the request
             var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
             request.httpMethod = "POST"
             request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
             
             // Build the completion block and send the request
             URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
             print("Finished")
             if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
             // Success
             print("Response: \(responseDetails)")
             } else {
             // Failure
             print("Error: \(error)")
             }
             }).resume()
             */
            
            
            /*  TEXTS EMERGENCY CONTACT 3 WITH LOCATION AND SAYS TIMER RUN OUT AND TELLS THEM TO TELL COPS AND COME THEMSELVES
             
             print("Starting...")
             var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
             var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
             //Note replace + = %2B , for To and From phone number
             var fromNumber = "%2B17727743493"// actual number is +9999999
             var toNumber = "%2B14088391663"// actual number is +9999999
             var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation")) please send your forces there and also send the police there"
             
             message = message.replacingOccurrences(of: "Optional(", with: "")
             message = message.replacingOccurrences(of: ")", with: "")
             message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
             
             // Build the request
             var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
             request.httpMethod = "POST"
             request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
             
             // Build the completion block and send the request
             URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
             print("Finished")
             if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
             // Success
             print("Response: \(responseDetails)")
             } else {
             // Failure
             print("Error: \(error)")
             }
             }).resume()
             */
            
            
            
            
            //UserDefaults.standard.set(0, forKey: "silentsostriggered")
        }
        
    }
    
    @IBAction func silentsospressed(_ sender: Any) {
        
        /*
         print("Starting...")
         var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
         var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
         //Note replace + = %2B , for To and From phone number
         var fromNumber = "%2B17727743493"// actual number is +9999999
         var toNumber = "%2B14088391663"// actual number is +9999999
         var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation"))"
         
         message = message.replacingOccurrences(of: "Optional(", with: "")
         message = message.replacingOccurrences(of: ")", with: "")
         message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
         
         // Build the request
         var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
         request.httpMethod = "POST"
         request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
         
         // Build the completion block and send the request
         URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
         print("Finished")
         if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
         // Success
         print("Response: \(responseDetails)")
         } else {
         // Failure
         print("Error: \(error)")
         }
         }).resume()
         */
        
        cancelsilentsosbutton?.isHidden = false
        silentsosbutton?.isHidden = true
        
        
    
        UserDefaults.standard.set(1, forKey: "silentsostriggered")
    
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timeraction), userInfo: nil, repeats: true)
    
        if ((UserDefaults.standard.integer(forKey: "timer") == 0) && (UserDefaults.standard.integer(forKey: "silentsostriggered") == 1))
        {
    
            /*
            print("Starting...")
            var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
            var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
            //Note replace + = %2B , for To and From phone number
            var fromNumber = "%2B17727743493"// actual number is +9999999
            var toNumber = "%2B14088391663"// actual number is +9999999
            var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation"))"
             
             message = message.replacingOccurrences(of: "Optional(", with: "")
             message = message.replacingOccurrences(of: ")", with: "")
             message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
            
            // Build the request
            var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
            request.httpMethod = "POST"
            request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
            
            // Build the completion block and send the request
            URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                print("Finished")
                if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                    // Success
                    print("Response: \(responseDetails)")
                } else {
                    // Failure
                    print("Error: \(error)")
                }
                 }).resume()
                 */
        
        }
        
    }
    
    
    @IBAction func cancelsilentsospressed(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "cancelsilentsosstoryboard") as UIViewController
        //sleep(1);
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func donecancelingsilentalarmbutton(_ sender: Any) {
        
        //@IBOutlet weak var cancelsilentalarmdonebutton: UIButton!
        
        if (!(cancelsilentalarmfirstsecurityquestiontextfield.text!.isEmpty) && !(cancelsilentalarmsecondsecurityquestiontextfield.text!.isEmpty))
        {
            
            var answer1 = String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestionsAnswer"))
            answer1 = answer1.replacingOccurrences(of: "Optional(", with: "")
            answer1 = answer1.replacingOccurrences(of: ")", with: "")
            answer1 = answer1.replacingOccurrences(of: "nil", with: "not selected yet, please pick one.")
            print(answer1)
            
            var answer2 = String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestionsAnswer"))
            answer2 = answer2.replacingOccurrences(of: "Optional(", with: "")
            answer2 = answer2.replacingOccurrences(of: ")", with: "")
            answer2 = answer2.replacingOccurrences(of: "nil", with: "not selected yet, please pick one.")
            print(answer2)
            
            if ((cancelsilentalarmfirstsecurityquestiontextfield.text! == answer1) && (cancelsilentalarmsecondsecurityquestiontextfield.text! == answer2))
            {
                
                print(cancelsilentalarmfirstsecurityquestiontextfield.text!)
                print(cancelsilentalarmsecondsecurityquestiontextfield.text!)
                
                print("disablingsilentalarm")
                
                UserDefaults.standard.set(0, forKey: "silentsostriggered")
                
                UserDefaults.standard.set(180, forKey: "timer")
                
                //timer.invalidate()
                
                
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "home") as UIViewController
                //sleep(1);
                self.present(vc, animated: true, completion: nil)
                
            }
        }
        
    }
    
    
    
    @IBAction func mainsospressed(_ sender: Any) {
        
        /*
 @IBOutlet weak var firstmainsosmessagelabel: UILabel!
 
 @IBOutlet weak var secondmainsosmessagelabel: UILabel!
         
         @IBOutlet weak var thirdmainsosmessagelabel: UILabel!
 */
        
        firstmainsosmessagelabel?.isHidden = false
        secondmainsosmessagelabel?.isHidden = false
        thirdmainsosmessagelabel?.isHidden = false
        
        
        
        /*  TEXTS CAMPUS SAFETY WITH LOCATION AND TELLS THEM TO TELL COPS
         
         print("Starting...")
         var twilioSID = "AC064355d3b9ee34aefed2bb3a1a42cf4e"
         var twilioSecret = "f78d44e45fb388272f74223b9ca75e2a"
         //Note replace + = %2B , for To and From phone number
         var fromNumber = "%2B17727743493"// actual number is +9999999
         var toNumber = "%2B14088391663"// actual number is +9999999
         var message = "\(UserDefaults.standard.object(forKey: "name")) is potentially in danger. Location is \(UserDefaults.standard.object(forKey: "currentlocation")) please send your forces there and also send the police there"
         
         message = message.replacingOccurrences(of: "Optional(", with: "")
         message = message.replacingOccurrences(of: ")", with: "")
         message = message.replacingOccurrences(of: "nil", with: "No phone # entered yet")
         
         // Build the request
         var request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
         request.httpMethod = "POST"
         request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
         
         // Build the completion block and send the request
         URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
         print("Finished")
         if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
         // Success
         print("Response: \(responseDetails)")
         } else {
         // Failure
         print("Error: \(error)")
         }
         }).resume()
         */
        
        
        
    }
    
    
    
    
    
    
}



extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        /*guard let location = locations.last else { return }
        
        locationManager.location?.coordinate.latitude
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)*/
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let center = getCenterLocation(for: mapView)
        
        let geoCoder = CLGeocoder()
        
        //guard let previousLocation = self.previousLocation else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
                guard let self = self else { return }
                
                if let _ = error {
                    //TODO: Show alert informing the user
                    return
                }
                
                guard let placemark = placemarks?.first else {
                    //TODO: Show alert informing the user
                    return
                }
                
                let areaOfInterest = placemark.areasOfInterest?.first ?? ""
                let streetNumber = placemark.subThoroughfare ?? ""
                let streetName = placemark.thoroughfare ?? ""
                
                DispatchQueue.main.async {
                    
                    self.addressLabel.text = "\(areaOfInterest) \(streetNumber) \(streetName) "
                    self.addressLabel.textColor = .yellow
                    
                    UserDefaults.standard.set("\(areaOfInterest) \(streetNumber) \(streetName) ", forKey: "currentlocation")
                    
                }
            }
        })
        
        //guard center.distance(from: previousLocation) > 15 else { return }
        
        //self.previousLocation = center
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .yellow
        
        return renderer
    }
    
}
