//
//  ViewController.swift
//  FoodList
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!

    var viewModel : FoodListViewModel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let repository = FoodRepository(dataSource: FoodDataSource())
        viewModel = FoodListViewModel(repository: repository)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FoodItemTableViewCell.nib, forCellReuseIdentifier: FoodItemTableViewCell.identifier)
        tableView.register(ImageInsertionTableViewCell.nib, forCellReuseIdentifier: ImageInsertionTableViewCell.identifier)
    }
    
    func bindViewModel(){
        viewModel.outputs.didError = didError()
        viewModel.outputs.didUpdateData = didUpdateData()
        
        viewModel.inputs.requestData()
    }
}

extension FoodListViewController {
    func didUpdateData() -> (()->Void)?{
        return {[weak self]  in
            guard let `self` = self else{return}
            self.tableView.reloadData()
        }
    }
    
    func didError() -> ((String)->Void)?{
        return {[weak self] error in
            guard let `self` = self else{return}
            self.showAlert(error)
        }
    }
}


extension FoodListViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.list[indexPath.row]
        switch data {
        case .imageInsertion:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageInsertionTableViewCell.identifier)  as? ImageInsertionTableViewCell else{return UITableViewCell()}
            return cell
        case .data(let food):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodItemTableViewCell.identifier) as? FoodItemTableViewCell else{return UITableViewCell()}
            cell.configCell(food)
            return cell
        }
    }
}
