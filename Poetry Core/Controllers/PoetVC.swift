//
//  PoetVC.swift
//  Poetry Core
//
//  Created by Afnan Ahmed on 26/12/2023.
//

import UIKit

class PoetVC: UIViewController {

    @IBOutlet weak var poetsTV: UITableView!
    
    private var allPoems: [Poems] = []
    private var manager = DataBaseManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var nav = self.navigationController?.navigationBar
        nav?.isHidden = true
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        dataManager()
        configureTV()
    }
    
    func dataManager()
    {
        allPoems = manager.fetchPoems()
        if allPoems.count == 0
        {
            for i in 0..<data.count
            {
                manager.addPoems(title: data[i].title, name: data[i].name, firstname: data[i].firstname, lastname: data[i].lastname, Poem: data[i].discription, like: data[i].like)
            }
        }
        else{
            print(allPoems)
        }
        
    }

}

extension PoetVC: UITableViewDelegate, UITableViewDataSource {
    
    func configureTV() {
        poetsTV.delegate = self
        poetsTV.dataSource = self
        poetsTV.register(UINib(nibName: "PoetTVC", bundle: .main), forCellReuseIdentifier: "PoetTVC")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPoems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PoetTVC", for: indexPath) as! PoetTVC
        cell.nameLBL.text = "\(allPoems[indexPath.row].firstname ?? "") \(allPoems[indexPath.row].lastname ?? "")"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        type = "\(allPoems[indexPath.row].firstname!)"
        tabBarController?.selectedIndex = 2
    }
}
