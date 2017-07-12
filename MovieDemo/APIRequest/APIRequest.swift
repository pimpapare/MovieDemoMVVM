//
//  APIRequest.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public class APIRequest {
    public typealias completionHandler = (AnyObject?, Error?) -> Void
    
    public static func request(withRouter router: AlamofireRouterProtocol, withHandler handler: @escaping completionHandler) -> Request?  {
        return Alamofire.request(router).responseJSON(completionHandler: { response in
            
            debugPrint(response)

            let statusCode = response.response?.statusCode
            
            switch response.result {
            case .success(let JSON):
                responseHandler(JSON: JSON as? [String : AnyObject], router: router, completionHandler: handler)
            case .failure(_):
                handler(nil, typeError(statusCode: statusCode))
                //APIError.init(status_code: statusCode ?? 0))
            }
        })
    }
    
    static func typeError(statusCode:Int?) -> ErrorService {
        
        switch statusCode ?? 0 {
        case 401: return .error401
        case 403: return .error403
        default: return .error500
        }
    }
    
    public static func responseHandler(JSON: [String : AnyObject]?, router: AlamofireRouterProtocol, completionHandler: APIRequest.completionHandler) {
        
        if let JSON = JSON {
            let instance: BaseModel = router.responseClass.init(withDictionary: JSON)
            completionHandler(instance, nil)
        }else{
            completionHandler(nil,nil)// already debug error
        }
    }
}

public enum ErrorService : Error {
    
    case error500
    case error401
    case error403
}

extension ErrorService: LocalizedError {
    
    public var errorDescription: String?{
        
        switch self {
        case .error401: return "401"
        case .error403: return "403"
        default: return "500"
        }
    }
}

public class APIError: LocalizedError {
    
    var status_code = 0
    
    required convenience public init?(status_code: Int) {
        self.init()
        self.status_code = status_code
    }
    
    public var errorDescription: String?
    {
        switch status_code {
        case 471:
            return NSLocalizedString("error_471", comment: "error")
        case 472:
            return NSLocalizedString("error_472", comment: "error")
        case 473:
            return NSLocalizedString("error_473", comment: "error")
        case 474:
            return NSLocalizedString("error_474", comment: "error")
        case 475:
            return NSLocalizedString("error_475", comment: "error")
        case 401:
            return NSLocalizedString("error_401", comment: "error")
        case 403:
            return NSLocalizedString("error_403", comment: "error")
        case 404:
            return NSLocalizedString("error_404", comment: "error")
        case 405:
            return NSLocalizedString("error_405", comment: "error")
        case 409:
            return NSLocalizedString("error_409", comment: "error")
        case 500:
            return NSLocalizedString("error_500", comment: "error")
        case 501:
            return NSLocalizedString("error_501", comment: "error")
        case 204:
            return NSLocalizedString("error_204", comment: "error")
        default:
            return NSLocalizedString("error_text", comment: "error")
        }
        //        return "\(origin) - code:\(status)(\(status_code)) description:\(descriptionString)"
    }
}

