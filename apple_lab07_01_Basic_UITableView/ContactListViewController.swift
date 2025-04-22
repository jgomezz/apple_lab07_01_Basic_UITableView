//
//  ContactListViewController.swift
//  apple_lab07_01_Basic_UITableView
//
//  Created by developer on 4/22/25.
//

import UIKit

class ContactListViewController: UIViewController,
                                 UITableViewDataSource /*,
                                 UITableViewDelegate */ {

    private let tableView = UITableView()

    private let contacts = Contact.mockContacts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contact List"
        view.backgroundColor = .systemBackground
        
        setupTableView()
    }

    func setupTableView() {
        
        // Add tableView to view hierarchy
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        /*
        // Enable Auto Layout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        */
        
        // Set delegates
        tableView.dataSource = self
        //tableView.delegate = self
        
        // Register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        
    }
    
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        /*
        // Configure cell to use subtitle style if it's not already
        if cell.detailTextLabel == nil {
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = ""
            
            let newCell = UITableViewCell(style: .subtitle, reuseIdentifier: "ContactCell")
            let contact = contacts[indexPath.row]
            newCell.textLabel?.text = contact.name
            newCell.detailTextLabel?.text = contact.phoneNumber
            return newCell
        }
        */
        
        let contact = contacts[indexPath.row]
        
        // Configure cell using the default style
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phoneNumber
        
        return cell
        
    }
    

    // MARK: - UITableViewDelegate
    /*
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
     */

}
