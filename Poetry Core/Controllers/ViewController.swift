//
//  ViewController.swift
//  Poetry Core
//
//  Created by Afnan Ahmed on 26/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sunflowerView: UIView!
    @IBOutlet weak var sunflowerTVHeight: NSLayoutConstraint!
    @IBOutlet weak var sunflowerTV: UITableView!
    @IBOutlet weak var poetsCV: UICollectionView!
    @IBOutlet weak var CategoriesCV: UICollectionView!

    @IBOutlet weak var bgimage: UIImageView!
    
    @IBOutlet weak var topPoet: UILabel!
    @IBOutlet weak var categoriesBGStackView: UIStackView!
    @IBOutlet weak var scrollViewBG: UIView!
    @IBOutlet weak var searchTV: UITableView!
    @IBOutlet weak var searchBarBtn: UIButton!
    @IBOutlet weak var searchBar: UITextField!
    private var allPoems: [Poems] = []
    private var manager = DataBaseManager()
    private var tempPoems: Poems?
    
    var catagories = ["Sad","Love","Happy","Nature","Justice","All"]
    var colors = [UIColor(named: "4095FF"), UIColor(named: "960808"), UIColor(named: "TabbarItem"), .purple, UIColor(named: "FF6D70"), .brown]
    var pics = [UIImage(named: "Sad"),UIImage(named: "Love"), UIImage(named: "Happy"), UIImage(named: "Love"), UIImage(named: "Happy"),UIImage(named: "Love"),]
    var search = [""]
    
    var sunflower = [UIImage(named: "Sunflowe1"), UIImage(named: "Sunflover2")]
    var sunflowerName = ["Brooks Haxton", "Ben Jonson"]
    var sunflowerPage = ["132 Pages", "144 Pages"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var nav = self.navigationController?.navigationBar
        nav?.isHidden = true
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sunflowerViewTapped(_:)))
        sunflowerView.addGestureRecognizer(tapGesture)
        
        configureCV()
        setLayout()
        setLayout2()
        configureTV()
        
        data.append(contentsOf: appPoems)
        dataManager()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        poetsCV.reloadData()
        CategoriesCV.reloadData()
    }
    @IBAction func searchBarBtnPressed(_ sender: Any) {
        performSearch()
    }
    
    
    func performSearch() {
        guard let searchTerm = searchBar.text?.lowercased(), !searchTerm.isEmpty else {
            // If the search term is empty, show all items or handle it according to your app's requirements
            return
        }

        let filteredPoems = catagories.filter { poem in
            return poem.lowercased().contains(searchTerm)
                   
        }

        search = filteredPoems
        // Do something with the filtered results, such as updating a table view or displaying them in some way
        print("Search Results: \(search)")
        searchTV.isHidden = false
        searchTV.reloadData()
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
            allPoems = manager.fetchPoems()
        }
        else{
            print(allPoems)
        }
        
    }
    
    @objc func BGImageViewTapped(_ sender: UITapGestureRecognizer) {
        searchTV.isHidden = true
        
    }
    
    
    
    @objc func sunflowerViewTapped(_ sender: UITapGestureRecognizer) {
            // Handle the tap event here
        if poetsCV.isHidden == false
        {
            bgimage.image = UIImage(named: "BG2")
            topPoet.isHidden = true
            CategoriesCV.isHidden = false
            categoriesBGStackView.isHidden = true
            poetsCV.isHidden = true
            sunflowerTV.isHidden = false
            sunflowerTVHeight.constant = CGFloat(0)
            UIView.animate(withDuration: 0.0) {
                self.view.layoutIfNeeded()
            }
            sunflowerTVHeight.constant = CGFloat(147 * sunflower.count)
            UIView.animate(withDuration: 1.0) {
                self.view.layoutIfNeeded()
            }
        }
        else
        {
            bgimage.image = UIImage(named: "BG")
            topPoet.isHidden = false
            CategoriesCV.isHidden = true
            categoriesBGStackView.isHidden = false
            poetsCV.isHidden = false
            sunflowerTV.isHidden = true
            sunflowerTVHeight.constant = CGFloat(120)
            UIView.animate(withDuration: 0.0) {
                self.view.layoutIfNeeded()
            }
        }

    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configureCV()
    {
        CategoriesCV.delegate = self
        CategoriesCV.dataSource = self
        CategoriesCV.register(UINib(nibName: "CategoriesCVC", bundle: .main), forCellWithReuseIdentifier: "CategoriesCVC")
        poetsCV.delegate = self
        poetsCV.dataSource = self
        poetsCV.register(UINib(nibName: "PoetCVC", bundle: .main), forCellWithReuseIdentifier: "PoetCVC")
    }
    
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 111,
                                 height: 111)
        CategoriesCV.setCollectionViewLayout(layout, animated: true)
    }
    func setLayout2() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 24
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 54,
                                 height: 83)
        poetsCV.setCollectionViewLayout(layout, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == CategoriesCV
        {
            return catagories.count
        }
        else if collectionView == poetsCV
        {
            return allPoems.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == CategoriesCV
        {
            let cell: CategoriesCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCVC", for: indexPath) as! CategoriesCVC
            cell.titleLBL.text = "\(catagories[indexPath.row]) Poems"
            cell.BGview.backgroundColor = colors[indexPath.row]
            cell.Imagewiew.image = pics[indexPath.row]
            return cell
        }
        else if collectionView == poetsCV
        {
            let cell: PoetCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "PoetCVC", for: indexPath) as! PoetCVC
            cell.nameLBL.text = allPoems[indexPath.item].firstname
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == CategoriesCV
        {
            type = "\(catagories[indexPath.row])"
            tabBarController?.selectedIndex = 2
        }
        else if collectionView == poetsCV
        {
            type = "\(allPoems[indexPath.row].firstname!)"
            tabBarController?.selectedIndex = 2
        }
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTV()
    {
        sunflowerTV.delegate = self
        sunflowerTV.dataSource = self
        sunflowerTV.register(UINib(nibName: "SunflowerTVC", bundle: .main), forCellReuseIdentifier: "SunflowerTVC")
        searchTV.delegate = self
        searchTV.dataSource = self
        searchTV.register(UINib(nibName: "searchTVC", bundle: .main), forCellReuseIdentifier: "searchTVC")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchTV {
            return search.count
        }
        else if tableView == sunflowerTV {
            return sunflower.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == searchTV {
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchTVC", for: indexPath) as! searchTVC
            cell.nameLBL.text = search[indexPath.row]
            return cell
        }
        else if tableView == sunflowerTV {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SunflowerTVC", for: indexPath) as! SunflowerTVC
            cell.imageview.image = sunflower[indexPath.row]
            cell.nameLBL.text = sunflowerName[indexPath.row]
            cell.pageLBL.text = sunflowerPage[indexPath.row]
            return cell
        }
        return UITableViewCell()
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == searchTV {
            return 30
        }
        else if tableView == sunflowerTV {
            return 147
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == searchTV {
            type = "\(search[indexPath.row])"
            searchTV.isHidden = true
            tabBarController?.selectedIndex = 2
        }
        else if tableView == sunflowerTV {
        }
    }
}
