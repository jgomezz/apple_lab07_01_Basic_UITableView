//
//  CustomContactCell.swift
//  apple_lab07_01_Basic_UITableView
//
//  Created by Jaime Gomez on 23/4/25.
//

import UIKit

class CustomContactCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with contact: Contact) {
        nameLabel.text = contact.name
        phoneLabel.text = contact.phoneNumber
        
        // Set avatar image based on first letter of name
        let firstLetter = String(contact.name.prefix(1)).uppercased()
        avatarImageView.image = createLetterAvatar(letter: firstLetter)
    }
    
    private func createLetterAvatar(letter: String) -> UIImage {
        let size = CGSize(width: 50, height: 50)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()!
        
        // Background color based on letter
        let colors: [UIColor] = [.systemBlue, .systemGreen, .systemOrange, .systemPurple, .systemRed]
        let colorIndex = Int(letter.utf8.first ?? 0) % colors.count
        colors[colorIndex].setFill()
        
        context.fillEllipse(in: CGRect(origin: .zero, size: size))
        
        // Text attributes
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.white
        ]
        
        // Center the letter
        let textSize = letter.size(withAttributes: attributes)
        let textRect = CGRect(
            x: (size.width - textSize.width) / 2,
            y: (size.height - textSize.height) / 2,
            width: textSize.width,
            height: textSize.height
        )
        
        letter.draw(in: textRect, withAttributes: attributes)
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }                  
    
}
