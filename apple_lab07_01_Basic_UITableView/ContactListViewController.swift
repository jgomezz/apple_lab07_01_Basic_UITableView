//
//  ViewController.swift
//  apple_lab07_01_Basic_UITableView
//
//  Created by developer on 4/22/25.
//

import UIKit

class ContactListViewController: UIViewController,
                                 UITableViewDataSource,
                                 UITableViewDelegate{

    @IBOutlet var tableView: UITableView!

    private let contacts = Contact.mockContacts()

    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Contact List"

        // Set delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set row height
        tableView.rowHeight = 74
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Contacts"
    }
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! CustomContactCell
        
        let contact = contacts[indexPath.row]
        // cell.textLabel?.text = contact.name
        // cell.detailTextLabel?.text = contact.phoneNumber
        cell.configure(with: contact)

        return cell
    }
    
    // MARK: - UITableViewDelegate
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let contact = contacts[indexPath.row]
        print("Selected contact: \(contact.name)")
        
        // Show alert with contact details
        let alert = UIAlertController(
            title: contact.name,
            message: "Phone: \(contact.phoneNumber)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        
    }
    
}

