//
//  EmployeeListViewController.swift
//  SwiftTakeHome
//  Main view controller that contains the employee directory, in charge of fetching the data from the desired endpoints, saving the data into CoreData, and displaying the data via table view.
//  Created by Jason Mo on 1/19/21.
//

import Foundation
import UIKit
import CoreData
class EmployeeListViewController: UIViewController {
    let networkHandler = NetworkHandler()
    let remoteImageHelper = RemoteImageHelper()
    let employeeListView = EmployeeListView()
    var employeeData: [Employee]?
    var employeeCoreDataCells: [EmployeeCoreData]?
    //Core Data helper
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Employee Directory"
        setupTableViewDelegate()
        self.retrieveEmployeeData()
        self.fetchEmployeeData()
        
        
    }
    
    func showActivityIndicator() {
        
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    
    func saveEmployeeData(employeeData: [Employee]?) {
        
        guard let employeeData = employeeData else { return }
        
        for employee in employeeData {
            let employeeCoreData = EmployeeCoreData(context: self.context)
            employeeCoreData.name = employee.fullName
            employeeCoreData.uuid = employee.uuid
            employeeCoreData.phoneNumber = employee.phoneNumber
            employeeCoreData.emailAddress = employee.emailAddress
            employeeCoreData.biography = employee.biography
            employeeCoreData.team = employee.team
            employeeCoreData.employeeType = employee.employeeType
            
            remoteImageHelper.retrieveImage(urlString: employee.photoUrlSmall) {

                image in employeeCoreData.smallPhotoImage = image?.pngData()
                
                do {
                    try! self.context.save()
                    
                    self.fetchEmployeeData()
                    
                }
                catch {
                    print("Error saving: \(error.localizedDescription)")
                }
            }
            remoteImageHelper.retrieveImage(urlString: employee.photoUrlLarge) {

                image in employeeCoreData.largePhotoImage = image?.pngData()
                do {
                    try! self.context.save()
                   
                    
                    
                }
                catch {
                    print("Error saving: \(error.localizedDescription)")
                }
            }
        }
        
    }
    
    func fetchEmployeeData() {
        
        do {
            self.employeeCoreDataCells = try context.fetch(EmployeeCoreData.fetchRequest())
        
//            print(employeeCoreDataCells)
            DispatchQueue.main.async {
                self.employeeListView.employeeListTableView.reloadData()
                
            }
        } catch {
            print("Error fetching: \(error)")
        }
        
    }
    
    func deleteData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "EmployeeCoreData")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch {
            
        }
        
    }
    
    func setupTableViewDelegate() {
        employeeListView.employeeListTableView.dataSource = self
        employeeListView.employeeListTableView.delegate = self
        
    }
    override func loadView() {
        view = employeeListView
    }
    
    func retrieveEmployeeData() {
        networkHandler.retrieveEmployeeInformation() {
            [weak self] (retrievedEmployeeData, error) in
            //allow weak self to be called as self
            guard let `self` = self else { return }
            guard let employeeData = retrievedEmployeeData else { return }
            
            DispatchQueue.main.async {
                self.showActivityIndicator()
            }
            //successful grab of data
            self.employeeData = employeeData
            //delete core data
            self.deleteData()
            //begin saving new data
            self.saveEmployeeData(employeeData: employeeData)
            DispatchQueue.main.async {
                self.hideActivityIndicator()
            }
        }
    }
    
    
    func standardrizeEmployeeType(employeeType: String) -> String {
        switch employeeType {
        case "FULL_TIME":
            return "Full time"
        case "PART_TIME":
            return "Part time"
        case "CONTRACTOR":
            return "Contractor"
        default:
            return ""
        }
    }
    
    
}


extension EmployeeListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return employeeCoreDataCells?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.Cell.employeeCellId, for: indexPath) as! EmployeeListTableViewCell
        
        
        
        /*
         initialize empty state
         */
        cell.smallPhotoImageView.image = UIImage(named: "stockEmployee")
        
        guard let fullName = employeeCoreDataCells?[indexPath.row].name, let emailInformation = employeeCoreDataCells?[indexPath.row].emailAddress, let phoneNumber = employeeCoreDataCells?[indexPath.row].phoneNumber, let team = employeeCoreDataCells?[indexPath.row].team, let employeeType = employeeCoreDataCells?[indexPath.row].employeeType, let biography = employeeCoreDataCells?[indexPath.row].biography, let smallImageData = employeeCoreDataCells?[indexPath.row].smallPhotoImage, let smallImage = UIImage(data: smallImageData) else { return cell }
        
        
        
        cell.employeeNameLabel.text = fullName
        cell.smallPhotoImageView.image = smallImage
        
        
        cell.emailInformation.employeeLabel.text = emailInformation
        cell.phoneInformation.employeeLabel.text = phoneNumber
        let standardEmployeeType = self.standardrizeEmployeeType(employeeType: employeeType)
        cell.employeeTypeInformation.employeeLabel.text = standardEmployeeType
        cell.teamInformation.employeeLabel.text = team
        cell.biographyInformation.employeeLabel.text = biography
        
        
        return cell
    }
    
    
}
