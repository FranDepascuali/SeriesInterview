//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import PureLayout
import ReactiveSwift
import ReactiveCocoa

final class ShowPreviewCell: UICollectionViewCell {

    let backgroundImageView: UIImageView = createBackgroundImageView()

    let titleLabel: UILabel = createTitleLabel()

    let genreLabel: UILabel = createGenreLabel()

    let view = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        fake()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fake() {
        genreLabel.text = "ADVENTURE"
        titleLabel.text = "Supergirl"
        contentView.backgroundColor = .red
    }

}

fileprivate extension ShowPreviewCell {

    fileprivate func addSubviews() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(view)
    }

    fileprivate func setConstraints() {
        view.backgroundColor = .green
        backgroundColor = .red
        view.autoPinEdgesToSuperviewEdges()
//        genreLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 7)
//        genreLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 7)
//
//        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 15)
//        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
    }

}

fileprivate func createBackgroundImageView() -> UIImageView {
    let backgroundImageView = UIImageView()

    return backgroundImageView
}

fileprivate func createTitleLabel() -> UILabel {
    let titleLabel = UILabel()

    titleLabel.textColor = UIColor(hexString: "e1f5ff")

    return titleLabel
}

fileprivate func createGenreLabel() -> UILabel {
    let genreLabel = UILabel()

    genreLabel.backgroundColor = UIColor(hexString: "#1e2b31")
    genreLabel.textColor = .white

    return genreLabel
}

extension UIColor {
    /**
     Initialzer based on hex string.

     - parameter hexString: It can either be uppercase or lowercase, and contain or not a leading #.
     */
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat

        let start: String.Index
        if hexString.hasPrefix("#") {
            start = hexString.characters.index(hexString.startIndex, offsetBy: 1)
        } else {
            start = hexString.startIndex
        }

        var hexColor = hexString.substring(from: start)

        if hexColor.characters.count == 6 {
            hexColor.append("ff")
        }

        if hexColor.characters.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
                a = CGFloat(hexNumber & 0x0000_00FF) / 255

                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        return nil
    }
}

class ListedShowsView: UIView {

    // I think this is better than tableView because collection views
    // are more adaptable to new layouts. So, if there is a change in
    // how we display the elements, a collectionView will adapt better
    let allShows = createAllShowsCollection()

    let allLabel: UILabel = createAllLabel()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension ListedShowsView {

    fileprivate func addSubviews() {
        addSubview(allLabel)
        addSubview(allShows)
    }

    fileprivate func setConstraints() {
        allLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        allLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15)

        allShows.autoPinEdge(.top, to: .bottom, of: allLabel, withOffset: 20)
        allShows.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
        allShows.autoPinEdge(toSuperviewEdge: .right, withInset: 15)
        allShows.autoPinEdge(toSuperviewEdge: .bottom, withInset: 15)
    }

}

class ListedShowsViewModel {

}

class ListedShowsViewController: UIViewController {

    let _view = ListedShowsView()

    let _viewModel: ListedShowsViewModel

    init(viewModel: ListedShowsViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(hexString: "#1b1b1b")
        view.addSubview(_view)
        _view.autoPinEdgesToSuperviewEdges()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        _view.allShows.dataSource = self
        _view.allShows.delegate = self
        _view.allShows.register(ShowPreviewCell.self, forCellWithReuseIdentifier: "ShowPreviewCell")
        _view.allShows.reloadData()
    }
}

extension ListedShowsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Rendering cell")
        let showPreviewCell = _view.allShows.dequeueReusableCell(withReuseIdentifier: "ShowPreviewCell", for: indexPath) as! ShowPreviewCell
        return showPreviewCell
    }
}



fileprivate func createAllLabel() -> UILabel {
    let allLabel = UILabel()

    allLabel.textColor = .white
    allLabel.alpha = 0.44
    // TODO: Localize this
    allLabel.text = "ALL"
    allLabel.font = .systemFont(ofSize: 12, weight: UIFont.Weight.medium)

    return allLabel
}

fileprivate func createAllShowsCollection() -> UICollectionView {
    let allShows = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())

    allShows.backgroundColor = .clear

    return allShows
}

fileprivate func createCollectionViewLayout() -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()

    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 20
    // TODO: Change this
    layout.itemSize = CGSize(width: 335, height: 156)

    return layout
}

//let controller = ListedShowsViewController(viewModel: ListedShowsViewModel())
let controller = ListedShowsViewController(viewModel: ListedShowsViewModel())
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = controller


