//
//  Model.swift
//  Stocks
//
//  Created by Владислав Сизонов on 09.10.2021.
//

import Foundation


typealias result = [Stock]

struct Stock: Codable {
    let avgTotalVolume: Int?
        let change, changePercent, close: Double?
        let closeTime: Int?
        let companyName: String?
        let currency: String?
        let delayedPrice: Double?
        let delayedPriceTime: Int?
        let extendedChange, extendedChangePercent, extendedPrice: Double?
        let extendedPriceTime: Int?
        let high: Double?
        let highTime, iexAskPrice, iexAskSize, iexBidPrice: Int?
        let iexBidSize: Int?
        let iexClose: Double?
        let iexCloseTime, iexLastUpdated: Int?
        let iexMarketPercent, iexOpen: Double?
        let iexOpenTime: Int?
        let iexRealtimePrice: Double?
        let iexRealtimeSize, iexVolume, lastTradeTime: Int?
        let latestPrice: Double?
        let latestSource: String?
        let latestTime: String?
        let latestUpdate, latestVolume: Int?
        let low: Double?
        let lowSource: String?
        let lowTime, marketCap: Int?
        let oddLotDelayedPrice: Double?
        let oddLotDelayedPriceTime: Int?
        let jsonModelOpen: Double?
        let openTime: Int?
        let openSource: String?
        let peRatio: Double?
        let previousClose: Double?
        let previousVolume: Int?
        let primaryExchange: String?
        let symbol: String?
        let volume: Int?
        let week52High, week52Low, ytdChange: Double?
        let isUSMarketOpen: Bool?
}


struct Logo: Codable {
   let url: String?
}
