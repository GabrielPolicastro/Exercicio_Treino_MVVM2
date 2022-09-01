//
//  pesquisaViewModel.swift
//  correcao_mvvm30deMaio
//
//  Created by Gabriel Policastro on 30/05/22.
//

import Foundation

protocol PesquisaViewModelDelegate {
    func exibeMensagemDeErro()
    func exibeCaracteristicasDa(pessoa: Pessoa)
}

class PesquisaViewModel {
    
    var delegate: PesquisaViewModelDelegate?
    
    private let service: Service = Service()
    
    func pesquisar(com cpf: String?)  {
        guard validarCPF(cpf) else {
            delegate?.exibeMensagemDeErro()
            return
        }
        
        service.pegarPessoaComClosureAPartirDe(cpf: cpf!) { pessoa in
            if let pessoa = pessoa {
                self.delegate?.exibeCaracteristicasDa(pessoa: pessoa)
            } else {
                self.delegate?.exibeMensagemDeErro()
            }
        }
    }
    
    private func validarCPF(_ cpf: String?) -> Bool {
        if let cpf = cpf, Int(cpf) != nil {
            if cpf.count == 11 {
                return true
            }
        }
        return false
    }
}
