//
//  ViewController.swift
//  ChooseYourAPI
//
//  Created by Sreenath Segar on 2023-09-14.
//

import UIKit


class ViewController: UIViewController {
    
    @IBAction func JSONPlaceholderButton(_ sender: UIButton) {
        Task {
            do {
                let response = try await JSONPlaceholderAPI_Helper.fetch()
                displayAPIResponse(response: response, title: "JSONPlaceholder API Response")
            }  catch API_Errors.CANNOT_CONVERT_STRING_TO_URL {
                print("Please insert connect url")
            } catch{
                print(error)
            }
        }
    }
    @IBAction func ReqResButton(_ sender: UIButton) {
        Task {
            do {
                let response = try await ReqresAPI_Helper.fetch()
                displayAPIResponse(response: response, title: "Reqres API Response")
            } catch API_Errors.CANNOT_CONVERT_STRING_TO_URL {
                print("Please insert connect URL")
            } catch {
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Function to display the API response in a alert box
    private func displayAPIResponse(response: Any, title: String) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                let alertController = UIAlertController(title: title, message: jsonString, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                }
            } else {
                print("Failed to convert JSON data to string")
            }
        } catch {
            print(error)
        }
    }
}

