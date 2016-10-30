//
//  ManufacturersViewController.swift
//  TCCRemote
//
//  Created by Felipe Lopes on 9/25/16.
//  Copyright © 2016 Felipe Lopes. All rights reserved.
//

import UIKit

class ManufacturersViewController
    : UITableViewController
{
    var bluetoothCommunication: BluetoothCommunication!
    var selectedDeviceCategory: DeviceCategory!
    var selectedManufacturer: Manufacturer!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedDeviceCategory.manufacturers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let manufacturer = self.selectedDeviceCategory.manufacturers[indexPath.row]
        
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = manufacturer.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedManufacturer = self.selectedDeviceCategory.manufacturers[indexPath.row]

        performSegue(withIdentifier: "SelectedManufacturer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SelectedManufacturer") {
            let remoteViewController = segue.destination as! DevicesViewController
        
            remoteViewController.bluetoothCommunication = self.bluetoothCommunication
            remoteViewController.selectedManufacturer = self.selectedManufacturer
        }
    }
}
