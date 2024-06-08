//
//  PoetryVC.swift
//  Poetry Core
//
//  Created by Afnan Ahmed on 26/12/2023.
//

import UIKit

class PoetryVC: UIViewController {
    
    
    private var allPoems: [Poems] = []
    private var manager = DataBaseManager()
    private var tempPoems: Poems?
    var temp: [Poems] = []
    
//    var type = "all"

    @IBOutlet weak var poetryTV: UITableView!
    var n = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var nav = self.navigationController?.navigationBar
        nav?.isHidden = true
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        configureTV()
        dataManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataManager()
        poetryTV.reloadData()
    }
    
    
    
    func dataManager()
    {
        temp = []
        allPoems = manager.fetchPoems()
        if allPoems.count == 0
        {
            for i in 0..<data.count
            {
                manager.addPoems(title: data[i].title, name: data[i].name, firstname: data[i].firstname, lastname: data[i].lastname, Poem: data[i].discription, like: data[i].like)
            }
        }
        else{
            
            print(type)
            if type == "All"
            {
                
            }
            else{
               
                
                print(allPoems.count)
                for i in 0..<allPoems.count
                {
                    print(allPoems[i].title)
                    if allPoems[i].title! == type
                    {
                        temp.append(allPoems[i])
                    }
                    else if allPoems[i].firstname! == type
                    {
                        temp.append(allPoems[i])
                    }
                }
                
                if temp == []
                {
                    
                }
                else
                {
                    allPoems = []
                    allPoems = temp
                    print(temp.count)
                    type = "All"
                    
                }
                
            }
        }
        
    }

}

extension PoetryVC: UITableViewDelegate, UITableViewDataSource {
    
    func configureTV()
    {
        poetryTV.delegate = self
        poetryTV.dataSource = self
        poetryTV.register(UINib(nibName: "PoetryTVC", bundle: .main), forCellReuseIdentifier: "PoetryTVC")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allPoems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PoetryTVC", for: indexPath) as! PoetryTVC
        if n == 0 {
            cell.BGimage.image = UIImage(named: "TVCBG")
            n = 1
        }
        else if n == 1 {
            cell.BGimage.image = UIImage(named: "TVCBG2")
            n = 2
        }
        else{
            cell.BGimage.image = UIImage(named: "TVCBG3")
            n = 0
        }
        cell.PoetryLBL.text = allPoems[indexPath.row].poem
        cell.PoetryLBL.setLineSpacing(lineHeightMultiple: 2.0)
        cell.copyTappedCallback = { [self] in
            
            UIPasteboard.general.string = allPoems[indexPath.row].poem ?? ""
            cell.copyLBL.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                UIView.animate(withDuration: 0.5, animations: {
                    cell.copyLBL.isHidden = true
                })
            }

         }
        if allPoems[indexPath.row].like == true {
            cell.likeBtn.setImage(UIImage(named: "BlackLike"), for: .normal)
        }
        else{
            cell.likeBtn.setImage(UIImage(named: "Like"), for: .normal)
        }
        
        cell.buttonTappedCallback = { [self] in
            
            if allPoems[indexPath.row].like == true
            {
                cell.likeBtn.setImage(UIImage(named: "Like"), for: .normal)
                manager.updateQoute(title: allPoems[indexPath.row].title ?? "", name: allPoems[indexPath.row].poemname ?? "", firstname: allPoems[indexPath.row].firstname ?? "", lastname: allPoems[indexPath.row].lastname ?? "", Poem: allPoems[indexPath.row].poem ?? "", like: false, userpoems: allPoems[indexPath.row])
            }
            else
            {
                cell.likeBtn.setImage(UIImage(named: "BlackLike"), for: .normal)
                manager.updateQoute(title: allPoems[indexPath.row].title ?? "", name: allPoems[indexPath.row].poemname ?? "", firstname: allPoems[indexPath.row].firstname ?? "", lastname: allPoems[indexPath.row].lastname ?? "", Poem: allPoems[indexPath.row].poem ?? "", like: true, userpoems: allPoems[indexPath.row])
            }
            
         }
        
        
        cell.shareTappedCallback = { [self] in
            
            let activityViewController = UIActivityViewController(activityItems: [allPoems[indexPath.row].poem ?? ""], applicationActivities: nil)

                   // On iPad, specify where the activity sheet should be anchored.
                   if let popoverController = activityViewController.popoverPresentationController {
                       popoverController.sourceView = self.view
                       popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                       popoverController.permittedArrowDirections = []
                   }

                   present(activityViewController, animated: true, completion: nil)
            
         }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        208
    }
    
    
    
}
