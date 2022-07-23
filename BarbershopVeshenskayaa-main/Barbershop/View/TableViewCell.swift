//
//  TableViewCell.swift
//  Barbershop
//
//  Created by mac on 23.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let indetificator = "TableViewCell"
    
    private let iconContainer: UIView = {
        let iconContainer = UIView()
        iconContainer.clipsToBounds = true
        iconContainer.layer.cornerRadius = 9
        iconContainer.layer.masksToBounds = true
        return iconContainer
    }()
    
    private let iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.tintColor = .white
        iconImage.contentMode = .scaleAspectFit
        return iconImage
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TableViewCell.indetificator)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImage)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator // стрелочка справа ячейки для перехода
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 0, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size/1.5
        iconImage.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)

        label.frame = CGRect(x: 20+iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width-20-iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
    
    //для повтроного использоания
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImage.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }
    
    public func configure(with model: SettingOptions) {
        label.text = model.title
        iconImage.image = model.icon
        iconContainer.backgroundColor = model.iconBackground
    }
}
