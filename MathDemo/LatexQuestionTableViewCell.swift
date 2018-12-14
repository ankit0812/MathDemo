//
//  LatexQuestionTableViewCell.swift
//  MathDemo
//
//  Created by KingpiN on 13/12/18.
//  Copyright © 2018 KingpiN. All rights reserved.
//

import UIKit
import iOSLaTeX

class LatexQuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var imageView1: LaTeXImageView!
    @IBOutlet weak var laTexImageViewHeightConstraint1: NSLayoutConstraint!
    
//    private var latexRenderer: LaTeXRenderer?
    var isFirstTime: Bool = true // This variable is for stopping the cell from rendering a LaTeX again and again
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        imageView1.heightConstraint = laTexImageViewHeightConstraint1
        imageView1.backgroundColorWhileRenderingLaTeX = UIColor.white
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
