//
//  RoundedView.swift
//  Artable
//
//  Created by Shahzaman Khan on 12/08/24.
//

import UIKit

class RoundedView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.4
        layer.shadowColor = AppColor.NavyBlue?.cgColor
    }
}


class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = AppColor.NavyBlue?.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
    }
}


class RoundedImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}
