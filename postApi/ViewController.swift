//
//  ViewController.swift
//  postApi
//
//  Created by R & W on 18/10/36.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    
    var arr : [WelcomeElement] = []
    var arr2 : [WelcomeElement] = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    
    func getData() {
            let url = URL(string: "https://restcountries.com/v3.1/all")
            var ur = URLRequest(url: url!)
            ur.httpMethod = "GET"
            URLSession.shared.dataTask(with: ur) { data, response, error in
                do{
                    if error == nil{
                        self.arr = try JSONDecoder().decode([WelcomeElement].self, from: data!)
                        self.arr2 = self.arr
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            
                        }
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }.resume()
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        
        navigationController?.pushViewController(navigation, animated: true)
        
       navigation.counttyName = arr[indexPath.row].name.common
        navigation.population = arr[indexPath.row].population.description
        navigation.countryImg = stringToimg(link: arr[indexPath.row].flags.png)!
        navigation.mudraImg = stringToimg(link: arr[indexPath.row].coatOfArms.png ?? "0")!
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell
        cell.l1.text = arr[indexPath.row].name.common
        cell.l2.text = arr[indexPath.row].name.official
        cell.img.image = stringToimg(link: arr[indexPath.row].flags.png)
        return cell
                                     
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func stringToimg (link : String) -> UIImage?{
        let url1 = URL (string: link)
        let data = try? Data(contentsOf: url1! as URL)
        return UIImage(data: data!)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
        
            arr = arr2.filter({ i in
                return i.name.common.contains(searchBar.text!)
            })
        tableView.reloadData()
        }
    
        
    }


