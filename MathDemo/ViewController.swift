//
//  ViewController.swift
//  MathDemo
//
//  Created by KingpiN on 13/12/18.
//  Copyright © 2018 KingpiN. All rights reserved.
//

import UIKit
import iOSLaTeX

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    internal var latexString: String = "This come from string. You can insert inline formula:" + "\\(ax^2 + bx + c = 0\\) " + "or displayed formula: $$\\sum_{i=0}^n i^2 = \\frac{(n^2+n)(1n+1)}{6}$$"
    
    var latexRenderer: LaTeXRenderer!
    
//    self.imageView1.inject(laTeXRenderer: self.latexRenderer!)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint("View did load started")
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.latexRenderer = LaTeXRenderer(parentView: self.view)
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LatexQuestionTableViewCell") as! LatexQuestionTableViewCell
        let latexStringLocal = latexString.replacingOccurrences(of: "2", with: "\(indexPath.row)")
        cell.imageView1.inject(laTeXRenderer: latexRenderer)
        if cell.isFirstTime  {
            cell.imageView1.render(latexStringLocal, shouldResize: true) { (error) in
                if let error = error {
                    print("\(error)")
                    return
                }
                print("Successfully rendered LaTeX")
                DispatchQueue.main.async {
                    cell.isFirstTime = false
                    tableView.beginUpdates()
                    tableView.endUpdates()
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
