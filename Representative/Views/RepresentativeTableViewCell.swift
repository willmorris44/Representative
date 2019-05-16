//
//  RepresentativeTableViewCell.swift
//  Representative
//
//  Created by Will morris on 5/16/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    func updateViews(representative: Representative) {
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        phoneLabel.text = representative.phone
        officeLabel.text = representative.office
        linkLabel.text = representative.link
    }
}
