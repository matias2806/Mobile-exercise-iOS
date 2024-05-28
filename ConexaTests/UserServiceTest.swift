//
//  UserServiceTest.swift
//  ConexaTests
//
//  Created by Matias Palmieri on 28/05/2024.
//

import XCTest
@testable import Conexa

class UsersServiceTests: XCTestCase {
    
    private var usersService: UsersService!
    
    override func setUpWithError() throws {
        usersService = UsersService()
    }
    
    //Prueba de respuesta de red exitosa
    func test_getUsers_success() {
        
        let expectation = expectation(description: "El controlador de finalización se llama")
        
        usersService.getUsers { result in
            switch result {
            case .success(let users):
                XCTAssertEqual(users.count, 30)
            case .failure:
                XCTFail("Fallo inesperado")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    //Prueba de URL no válida
    func test_get_users_invalid_URL() {
        usersService.urlTentative = URL(string: "https://INVALIDURL.org/users")
        
        let expectation = expectation(description: "Completion handler is called")
        
        usersService.getUsers { result in
            switch result {
            case .success:
                XCTFail("Unexpected success")
            case .failure(let error):
                XCTAssertEqual(error as? NetworkError, NetworkError.invalidURL)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
