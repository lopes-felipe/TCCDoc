//
//  BluetoothViewController.swift
//  TCCRemote
//
//  Created by Felipe Lopes on 9/11/16.
//  Copyright © 2016 Felipe Lopes. All rights reserved.
//

import UIKit

class BluetoothViewController: UIViewController {
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var statusActivity: UIActivityIndicatorView!
    
    @IBOutlet var nextButton: UIButton!
    
    var bluetoothCommunication: BluetoothCommunication!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.bluetoothCommunication = BluetoothCommunication(serviceUUID: "A163B9B9-0B57-0993-82CA-3C621BBA467E", delegate: self)
        
        // TODO: EXCLUIR
        bluetoothCommunicationDidConnect(bluetoothCommunication: self.bluetoothCommunication)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BluetoothConnected" {
            let manufacturersViewController = segue.destination as! ManufacturersViewController
            
            manufacturersViewController.bluetoothCommunication = self.bluetoothCommunication
        }
    }
}

extension BluetoothViewController: BluetoothCommunicationDelegate{
    func bluetoothCommunication(bluetoothCommunication: BluetoothCommunication, didReceiveValue value: Int8){
        //TODO: Tratar valor recebido
    }
    
    func bluetoothCommunicationDidConnect(bluetoothCommunication: BluetoothCommunication) {
        statusLabel.text = "      Conexão efetuada com sucesso"
        statusLabel.sizeToFit()
        statusActivity.stopAnimating()
        
        nextButton.isEnabled = true
    }
}