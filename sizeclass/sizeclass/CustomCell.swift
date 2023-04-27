//
//  CustomCell.swift
//  sizeclass
//
//  Created by Anarock on 11/04/23.
//

import UIKit

class CustomCell: UITableViewCell {

    let myImageView = UIImageView()
    let myLabel = UILabel()
    
    var regularConstraints: [NSLayoutConstraint] = []
    var compactConstraints: [NSLayoutConstraint] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            contentView.addSubview(myImageView)
            contentView.addSubview(myLabel)

            myImageView.translatesAutoresizingMaskIntoConstraints = false
            myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - regular constraints
             regularConstraints = [
                //side by side
                //ipad
                myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                myImageView.heightAnchor.constraint(equalToConstant: 150),
                myImageView.widthAnchor.constraint(equalToConstant: 200),

                myLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 20),
                myLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                
            ]

        //MARK: - compact constraints
             compactConstraints = [
                //label below image
                //compact regular iphone
                myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                myImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                myImageView.heightAnchor.constraint(equalToConstant: 100),
                myImageView.widthAnchor.constraint(equalToConstant: 120),

                myLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 20),
                myLabel.centerXAnchor.constraint(equalTo: myImageView.centerXAnchor),
                myLabel.heightAnchor.constraint(equalToConstant: 40),
                myLabel.widthAnchor.constraint(equalToConstant: 100),
            ]

//            NSLayoutConstraint.activate(compactConstraints)
        overrideTraitCollection(size: UIScreen.main.bounds.size)
//        print(UIScreen.main.traitCollection.horizontalSizeClass==UIUserInterfaceSizeClass.compact)
//        print("1",UIScreen.main.bounds.size.width,"width" ,UIScreen.main.bounds.size.height)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    //MARK: - Trait Did Change
        override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            super.traitCollectionDidChange(previousTraitCollection)
            overrideTraitCollection(size: UIScreen.main.bounds.size)
//            print("2",UIScreen.main.bounds.size.width,"width" ,UIScreen.main.bounds.size.height)
        }

    //MARK: - override Trait Collection
        private func overrideTraitCollection(size: CGSize) {
            if (UIScreen.main.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact || UIScreen.main.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact){
                NSLayoutConstraint.activate(compactConstraints)
                NSLayoutConstraint.deactivate(regularConstraints)
                
            } else {
                self.myLabel.font = .systemFont(ofSize: 30, weight: .bold)
                NSLayoutConstraint.activate(regularConstraints)
                NSLayoutConstraint.deactivate(compactConstraints)
            }
        }

}
