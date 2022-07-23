//
//  SettingOptions.swift
//  Barbershop
//
//  Created by mac on 23.07.2022.
//
import UIKit

struct SettingOptions {
    let title: String
    let icon: UIImage?
    let iconBackground: UIColor
//    let handler:(() -> ())
}

struct Section {
    let title: String
    let options: [SettingOptions]
}


