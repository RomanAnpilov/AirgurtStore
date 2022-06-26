//
//  SearchViewController.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 25.06.2022.
//

import UIKit

protocol SearchViewInput: AnyObject {
    func reloadData()
}

class SearchViewController: BaseCollectionController {
    
    var output: SearchViewOutput!
    
    private let label = UILabel(text: "Please enter some term above",
                                font: .boldSystemFont(ofSize: 20))
    private let searchController = UISearchController(searchResultsController: nil)
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifer)
        
        setupSearchBar()
        setupView()
    }
    
    private func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    private func setupView() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension SearchViewController: SearchViewInput {
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension SearchViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let number = output.numberOfSections()
        label.isHidden = number != 0
        return number
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifer,
                                                      for: indexPath) as! SearchCell
        let viewModel = output.cellViewModel(for: indexPath)
        cell.setup(with: viewModel)
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){ (_) in
            self.output.didChangeSearch(appTerm: searchText)
        }
    }
}
