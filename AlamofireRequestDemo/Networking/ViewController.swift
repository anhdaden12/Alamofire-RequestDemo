//
//  ViewController.swift
//  Networking
//
//  Created by Ngoc on 9/12/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnGet(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return}
        Alamofire.request(url).responseJSON { (reponse) in
            if let data = reponse.data {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    print(posts)
                } catch {
                    print(error)
                }
            }
        }
//        URLSession.shared.dataTask(with: url) {[weak self] (data, reponse, error) in
//            if let data = data {
//                do {
//
//                    let posts  = try JSONDecoder().decode([Post].self, from: data)
//
////                    var posts = [Post]()
////                    guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else { return }
////                    for object in jsonObject {
////                        let body = object["body"] as? String ?? ""
////                        let title = object["title"] as? String ?? ""
////                        let id = object["id"] as? Int ?? 0
////                        let userId = object["userId"] as? Int ?? 0
////
////                        let post = Post(userId: userId ,id: id, body: body , title: title )
////                        posts.append(post)
////                    }
//                    print(posts)
////                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
////                    let jsonString = String(data: jsonData, encoding: .utf8)
////                    DispatchQueue.main.async {
////                        self?.textView.text = jsonString
////                    }
//                } catch {
//                    print(error)
//                }
//            }
//        }.resume()
    }
    
    @IBAction func btnPost(_ sender: Any) {
        let parametter =
            [
                "userName" : "dumamay",
                "message": "I'm not learning",
                "createDate": Date().description
        ]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return}
        
        var reQuest = URLRequest(url: url)
        
        reQuest.httpMethod = "POST"
        reQuest.addValue("application/json", forHTTPHeaderField: "COntent-Type")
        
        let httpBody = try? JSONSerialization.data(withJSONObject: parametter, options: [])
        reQuest.httpBody = httpBody
        
        URLSession.shared.dataTask(with: reQuest) { [weak self](data, reponse, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                    let jsonString = String(data: jsonData, encoding: .utf8)
                    DispatchQueue.main.async {
                        self?.textView.text = jsonString
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

