//
//  ShowsRequest.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import Alamofire

enum ShowsRequest: URLRequestConvertible {

    case index(page: Int)
    case episodes(showID: Int)
    case search(showName: String)

    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        return .get
    }

    // MARK: - Path
    private var path: String {
        switch self {
        case .index:
            return "shows"
        case .episodes(let showID):
            return "/shows/\(showID)/episodes"
        case .search:
            return "/search/shows"
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Networking.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .index(let page):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: ["page": page])
        case .search(let showName):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: ["q": showName])
        default:
            break
        }

        return urlRequest
    }
}
