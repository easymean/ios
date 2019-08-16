//
//  ViewController.swift
//  KUCookRecipe0809
//
//  Created by cscoi008 on 2019. 8. 9..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var recipies: [Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let decoder: JSONDecoder = JSONDecoder()
        //snakecase는 언더바를 사용하는 문자열
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "recipies") else {
            print("data asset을 가져올 수 없습니다.")
            return
        }
        
        let jsonData: Data = dataAsset.data
        
        do {
            recipies = try decoder.decode([Recipe].self, from: jsonData)
        } catch {
            print("json decoding failed : ", error.localizedDescription)
        }
        
        print("\(recipies.count)개 레시피 불러옴")
        
    }
    
    //화면의 이동을 준비하는 함수
    //다음 화면으로 이동하기 전에 해야 할 일을 적으시오.
    //segue-스토리보드 이동선
    //sender-이 화면 이동을 일으킨 객체
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //눌린 것이 버튼인가?
        guard let button: UIButton = sender as? UIButton else {
            print("sender가 버튼이 아닙니다")
            return
        }
        
        //버튼의 태그를 확인
        let tag: Int = button.tag
        
        //다음 뷰 컨트롤러가 recipeViewController인지 확인
        guard let nextViewController = segue.destination as? RecipeViewController else {
            print("목적지가 RecipeViewController가 아닙니다")
            return
        }
        
        //다음 뷰 컨트롤러에게 데이터 전달
        nextViewController.recipe = recipies[tag]
        
        if tag == 0 {
            print("0번 버튼이 선택되었습니다.")
        } else if tag == 1
        {
            print("1번 버튼이 선택되었습니다.")
        }
        else if tag == 2
        {
            print("2번 버튼이 선택되었습니다.")
        }
        else if tag == 3
        {
            print("3번 버튼이 선택되었습니다.")
        }
        
    
    
    }
    

    
}

