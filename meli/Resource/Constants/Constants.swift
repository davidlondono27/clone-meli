//
//  Constants.swift
//  meli
//
//  Created by David Londoño on 7/07/22.
//

import Foundation

class Constants {
    static let textFieldTip = "Buscar en Mercado Libre"
    static let cancel = "Cancelar"
    static let searchTip = "Haz tu primera búsqueda"
    static let results = "resultados"
    static let bestSeller = "MÁS VENDIDO"
    static let used = "Usado"
    static let itemError = "Error consumiendo servicio ItemDetails"
    static let itemDetailsError = "Error consultando los ItemDetails"
    static let description = "Descripción:"
}

class ConstantsColors {
    static let blueMeli = "blue_Meli"
    static let yellowMeli = "yellow_Meli"
    static let whiteMeli = "white_Meli"
    static let bgColor = "bg_Meli"
    static let grayMeli = "gray_Meli"
    static let blackMeli = "black_Meli"
    static let grayDark = "grayDark_Meli"
    static let orangeMeli = "orange_Meli"
}

class ConstantsFonts {
    static let proximaNova = "ProximaNova"
}

class ConstantsURL {
    static let searchURL = "https://api.mercadolibre.com/sites/MCO/search?q="
    static let itemBaseURL = "https://api.mercadolibre.com/items/"
    static let descriptionURL = "/description"
}
