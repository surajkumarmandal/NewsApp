//
//  NewsFeedViewController.swift
//  NewsApp
//
//  Created by Suraj Kumar Mandal on 12/06/22.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    @IBOutlet weak var newsCategoryLabel: UILabel!
    @IBOutlet weak var newsListTableView: UITableView!
    
    var viewModel = NewsFeedViewModel()
    var newsModel: NewsFeedModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.delegate = self
        // Set tableview delegate and datasource
        newsListTableView.delegate = self
        newsListTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Reachability.isConnectedToNetwork() {
            viewModel.getNewsFeed()
        } else {
            Alert.showInternetFailureAlert(on: self)
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = newsModel?.results?.count else {
            return 0
        }
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as? NewsFeedTableViewCell else {
            return UITableViewCell()
        }
        guard let data = newsModel?.results?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.newsTitleLabel.text = data.title
        // As we have to show only 1 image
        if let url = URL(string: data.media?[0].mediaMetadata?[0].url ?? ""){
            cell.newsImageView.load(url: url)
        }
        cell.newsAbstractLabel.text = data.abstract
        cell.newsAuthorLabel.text = data.byline
        cell.newsPublishedDateLabel.text = data.published_date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = newsModel?.results?[indexPath.row] else {
            return
        }
        // Move to web view with url
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        vc.newsURL = data.url ?? ""
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension NewsFeedViewController: NewsFeedProtocol {
    func startLoader() {
        ActivityIndicator.start()
    }
    
    func stopLoader() {
        ActivityIndicator.stop()
    }
    
    func loadData(data: NewsFeedModel?) {
        self.newsModel = data
        DispatchQueue.main.async {
            self.stopLoader()
            self.newsListTableView.reloadData()
        }
    }
}
