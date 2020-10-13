//
//  FontsViewController.swift
//  PostcardApp
//
//  Created by Stanly Shiyanovskiy on 12.10.2020.
//

import MobileCoreServices
import UIKit

public final class FontsViewController: UITableViewController {

    // MARK: - Data
    private let fonts = UIFont.familyNames.sorted()
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fonts"

        tableView.dragDelegate = self
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let fontName = fonts[indexPath.row]
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 18)
        return cell
    }
}

// MARK: - UIDropInteractionDelegate
extension FontsViewController: UITableViewDragDelegate {
    public func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let string = fonts[indexPath.row]
        guard let data = string.data(using: .utf8) else { return [] }
        let itemProvider = NSItemProvider(item: data as NSData, typeIdentifier: kUTTypePlainText as String)
        return [UIDragItem(itemProvider: itemProvider)]
    }
}
