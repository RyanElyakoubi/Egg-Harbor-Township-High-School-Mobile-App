//
//  UIViewControllerAssist.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 8/13/22.
//

import UIKit

public class UIViewControllerAssist {
    public static func initializeViewControllerWithIdentifier(_ storyBoardIdenfier:String, fromStoryBoard name:String) -> UIViewController {
        let storyBoard = UIStoryboard(name: name, bundle: .main)
        return storyBoard.instantiateViewController(withIdentifier: storyBoardIdenfier)
    }
}
