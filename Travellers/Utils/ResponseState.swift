//
//  DataState.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//


enum ResponseState<T> {
    case success(T)
    case error(String)
}
