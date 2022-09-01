//
//  Service.swift
//  correcao_mvvm30deMaio
//
//  Created by Gabriel Policastro on 30/05/22.
//

import Foundation

class Service {
    
    func pegarPessoaComClosureAPartirDe(cpf: String, completion: @escaping (Pessoa?) -> Void) {
        
        let pessoas = listaDePessoas()
        
        var pessoaEncontrada: Pessoa? = nil
        
        for pessoa in pessoas {
            if pessoa.cpf == cpf {
                pessoaEncontrada = pessoa
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            completion(pessoaEncontrada)
        }
    }
    
    func pegarPessoaAPartirDe(cpf: String) -> Pessoa? {
        
        let pessoas = listaDePessoas()
        
        for pessoa in pessoas {
            if pessoa.cpf == cpf {
                return pessoa
            }
        }
        return nil
    }
    
    private func listaDePessoas() -> [Pessoa] {
        return [
            Pessoa(
                cpf: "12345678900",
                name: "Mohamed",
                adress: "Rua 001",
                age: 45,
                height: 187
            ),
            Pessoa(
                cpf: "12345678901",
                name: "Khaled",
                adress: "Rua 002",
                age: 20,
                height: 190
            ),
            Pessoa(
                cpf: "12345678902",
                name: "Youseff",
                adress: "Rua 003",
                age: 50,
                height: 180
            ),
            Pessoa(
                cpf: "12345678903",
                name: "Said",
                adress: "Rua 004",
                age: 30,
                height: 178
            ),
            Pessoa(
                cpf: "12345678904",
                name: "Mustafá",
                adress: "Rua 005",
                age: 99,
                height: 180
            ),
            Pessoa(
                cpf: "12345678905",
                name: "Sarah",
                adress: "Rua 006",
                age: 88,
                height: 162
            ),
        ]
    }
}



