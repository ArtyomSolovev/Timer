//
//  TableCellTableViewCell.swift
//  Timer
//
//  Created by Артем Соловьев on 11.07.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let id = "CustomTableViewCell"
    
    let _timer: UILabel = {
        let _timer = UILabel()
        return _timer
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(_timer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        _timer.frame = CGRect(x: contentView.frame.size.width * 0.8, y: contentView.frame.size.height * 0.1, width: contentView.frame.size.width * 0.2, height: contentView.frame.size.height * 0.8)
        _timer.textAlignment = .center
    }
    
}
