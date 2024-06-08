//
//  PoetryTVC.swift
//  Poetry Core
//
//  Created by Afnan Ahmed on 26/12/2023.
//

import UIKit

class PoetryTVC: UITableViewCell {

    @IBOutlet weak var copyLBL: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var BGimage: UIImageView!
    @IBOutlet weak var PoetryLBL: UILabel!
    var copyTappedCallback: (() -> Void)?
    var buttonTappedCallback: (() -> Void)?
    var shareTappedCallback: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func sareBtnPressed(_ sender: Any) {
        shareTappedCallback?()
    
    }
    @IBAction func copyBtnPressed(_ sender: Any) {
        copyTappedCallback?()
    }
    @IBAction func ressedlikeBtn(_ sender: Any) {
        buttonTappedCallback?()
    }
}
