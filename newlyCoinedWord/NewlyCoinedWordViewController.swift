//
//  NewlyCoinedWordViewController.swift
//  newlyCoinedWord
//
//  Created by 김윤우 on 5/18/24.
// 방법: Dictionary, Array, switch case 문

import UIKit
// gestureRecognizer 사용시 UIGestureRecognizerDelegate 상속
class NewlyCoinedWordViewController: UIViewController {
    
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var recommandButtonFirst: UIButton!
    @IBOutlet var recommandButtonSecond: UIButton!
    @IBOutlet var recommandButtonThird: UIButton!
    @IBOutlet var recommandButtonFourth: UIButton!
    
    @IBOutlet var resultImageView: UIImageView!

    @IBOutlet var resultLabel: UILabel!
    
    var newlyCoinedWordDic =
    [
        "얼죽아" : "얼어 죽어도 아이스커피'의 줄임말. 추운 날씨에도 아이스 아메리카노",
        "스불재" : "스스로 불러온 재앙'으로, 순전히 자신이 자초한 일로 다른 누구를 탓할 수 없는 상황에 쓰는 말",
        "삼귀다" : "아직 사귀는 사이가 아닌 썸 타는 단계. 사귀다의 '사'를 숫자 4에 빗대어 4가 되기 전 3=삼으로 표현",
        "고답이": "고구마 잔뜩 먹은 것처럼 답답하게 행동하는 사람을 일컫는 말",
        "내또출" : "'내일 또 출근'의 줄임말. 월요일 출근에 대한 스트레스를 표현",
        "꾸안꾸" : "'꾸민 듯 안 꾸민 듯' 내추럴하지만 스타일리시한 패션 센스를 이르는 말",
        "마상" : "마음의 상처'를 줄인 말. 아쉽거나 실망스러운 일이 있을 때 주로 씀",
        "낄낄빠빠" : "낄 때 끼고 빠질 때 빠지자'로 나설 상황이 아닌데 눈치 없이 오지랖을 부리는 사람에게 쓰는 표현",
        "복세편살" : "'복잡한 세상 편하게 살자'의 준말. 스스로가 원하는 방식으로 즐겁게 살겠다는 의지를 다지는 말"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextFieldUi()
        
        searchButtonUi()
        
        recommandButtonUi(recommandButtonFirst, "얼죽아")
        recommandButtonUi(recommandButtonSecond, "스불재")
        recommandButtonUi(recommandButtonThird, "삼귀다")
        recommandButtonUi(recommandButtonFourth, "꾸안꾸")
        
        resultImageView.image = UIImage(named: "background")
        resultImageView.contentMode = .scaleAspectFill
        
        resultLabelUi()
        
        // storyboard에서 tabgesturerecognizer 추가 후
        // viewdidload에 추가
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
//        tapGesture.delegate = self
//        
//        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    @IBAction func textFieldreturnButtonTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
    }
    @IBAction func recommandButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            resultLabel.text = "\(newlyCoinedWordDic["얼죽아"]!)"
        case 1:
            resultLabel.text = "\(newlyCoinedWordDic["스불재"]!)"
        case 2:
            resultLabel.text = "\(newlyCoinedWordDic["스불재"]!)"
        case 3:
            resultLabel.text = "\(newlyCoinedWordDic["꾸안꾸"]!)"
        default:
            return
        }
        view.endEditing(true)
        
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        searchWord()
        view.endEditing(true)
        //        print(newlyCoinedWordDic["\(searchWord)"])
        
        //        print(newlyCoinedWordDic["낄낄빠빠"])
    }
    
    // return
    @IBAction func reuturnButtonTapped(_ sender: UITextField) {
        searchWord()
    }
    

    // textField와 신조어 데이터 비교 후 결과 레이블에 출력하는 함수
    func searchWord() {
        for searchWord in newlyCoinedWordDic.keys {
            //            print(newlyCoinedWordDic.keys)
            //            print( searchTextField.text!)
            if searchWord == searchTextField.text!  {
                resultLabel.text = newlyCoinedWordDic["\(searchWord)"]!
//                print(searchWord,"1번째")
//                print(searchTextField.text!,"1번째")
                break
                
            } else if searchTextField.text!.count == 0 {
                resultLabel.text = "궁금한 신조어를 검색창에 입력해주세요!" }
//            } else {
//                resultLabel.text = "아직 업데이트 되지 않은 신조어 입니다!\n 추후에 업데이트 해 놓을게요"
//                print(searchWord)
//                print(searchTextField.text!)
//            }
        }
        
    }
    
    func recommandButtonUi(_ button:UIButton ,_ newCoiendWord:String ) {
        button.setTitle(newCoiendWord, for: .normal)
        button.tintColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
    }
    
    func resultLabelUi() {
        resultLabel.text = "검색창에서 궁금한 신조어를 입력해주세요!"
        resultLabel.textAlignment = .center
        //adjustsFontSizeToFitWidth 값을 true로 주지 않으면 numberof Lines가 먹히지 않는다
        resultLabel.adjustsFontSizeToFitWidth = true
        resultLabel.numberOfLines = 0
    }
    
    func searchTextFieldUi() {
        searchTextField.placeholder = "궁금한 신조어를 입력해주세요!"
        searchTextField.tintColor = .black
        // textField 들여쓰기
        searchTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        // leftViewMode를 설정하지 않으면 적용되지 않음
        searchTextField.leftViewMode = .always
        searchTextField.borderStyle = .line
        searchTextField.layer.borderWidth = 2
    }
    func searchButtonUi() {
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
    }
}
