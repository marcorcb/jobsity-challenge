//
//  ShowsAPI.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import Foundation
import Alamofire

protocol ShowsServiceProvider {
    func shows(page: Int,
               then handle: @escaping (Result<[ShowsResponseEntity.Data], ShowsServiceError>) -> Void)
    func episodes(showID: Int,
                  then handle: @escaping (Result<[EpisodesResponseEntity.Data], ShowsServiceError>) -> Void)
    func search(showName: String,
                then handle: @escaping (Result<[SearchResponseEntity.Data], ShowsServiceError>) -> Void)
}

enum ShowsServiceError: Error {
    case responseParse
    case network
}

final class ShowsAPI: ShowsServiceProvider {
    func shows(
        page: Int,
        then handle: @escaping (Result<[ShowsResponseEntity.Data], ShowsServiceError>) -> Void) {
        AF.request(ShowsRequest.index(page: page))
            .responseDecodable { (response: AFDataResponse<[ShowsResponseEntity.Data]>) in
                switch response.result {
                case let .success(data):
                    handle(.success(data))
                case let .failure(error):
                    handle(.failure(.network))
                }
            }
    }

    func episodes(
        showID: Int,
        then handle: @escaping (Result<[EpisodesResponseEntity.Data], ShowsServiceError>) -> Void
    ) {
        AF.request(ShowsRequest.episodes(showID: showID))
            .responseDecodable { (response: AFDataResponse<[EpisodesResponseEntity.Data]>) in
                switch response.result {
                case let .success(data):
                    handle(.success(data))
                case let .failure(error):
                    handle(.failure(.network))
                }
            }
    }

    func search(showName: String,
                then handle: @escaping (Result<[SearchResponseEntity.Data], ShowsServiceError>) -> Void) {
        AF.request(ShowsRequest.search(showName: showName))
            .responseDecodable { (response: AFDataResponse<[SearchResponseEntity.Data]>) in
                switch response.result {
                case let .success(data):
                    handle(.success(data))
                case let .failure(error):
                    handle(.failure(.network))
                }
            }
    }
}
