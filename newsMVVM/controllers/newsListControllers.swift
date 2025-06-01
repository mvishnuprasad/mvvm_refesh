//
//  newsListControllers.swift
//  newsMVVM
//
//

import Foundation
import UIKit
class newsListTableVIewController : UITableViewController{
    private var articleListVm : ArticleListVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=353f56640b9e400aab4e5ff95981fb5b")!
        Webservices().getArticles(url: url ){articles in
            if let art = articles {
                self.articleListVm = ArticleListVM(articles: art)
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func numberOfSections(in tableVIew : UITableView) -> Int{
        return self.articleListVm == nil ? 0 : self.articleListVm.numberofSection
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVm == nil ? 0 : self.articleListVm.numberofROwsinSection(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else{
            fatalError("error")
        }
        let artileVM = self.articleListVm.articleAtIndex(indexPath.row)
        cell.descriptionLable.text = artileVM.description
        cell.titleLabel.text = artileVM.title
        return cell
    }
}
