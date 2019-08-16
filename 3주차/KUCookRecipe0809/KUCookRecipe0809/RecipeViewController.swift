//
//  RecipeViewController.swift
//  KUCookRecipe0809
//
//  Created by cscoi008 on 2019. 8. 9..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ingredientLabel: UILabel!
    @IBOutlet var recipeTextView: UITextView!
    
    var recipe: Recipe!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ingredientLabel.text = recipe.ingredient
        recipeTextView.text = recipe.recipe
        self.navigationItem.title = recipe.title
        let image = UIImage(named: recipe.imageName)
        imageView.image = image
        
        ingredientLabel.sizeToFit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
