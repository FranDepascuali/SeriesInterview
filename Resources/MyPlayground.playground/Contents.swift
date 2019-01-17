//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import PureLayout
import ReactiveSwift
import ReactiveCocoa

class ListedShows: UIViewController {

    // I think this is better than tableView because collection views
    // are more adaptable to new layouts. So, if there is a change in
    // how we display the elements, a collectionView will adapt better
    let allShows = UICollectionView()

    let allLabel = UILabel()

}

class ListedShowsViewModel {

}

class ListedShowsViewController: UIViewController {

    let _view = ListedShows()

    let _viewModel: ListedShowsViewModel

    init(viewModel: ListedShowsViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = ShowDetailsViewController(viewModel: ShowDetailsViewModel())

print("Gwlo")


