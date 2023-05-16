# This Lab is to import Airflight demo data into an existing Heatwave AutoML Database
# Environment :
### 1. A Running MDS with Heatwave Instance on Private VCN
### 2. Cloud Shell on OCI 
### 3. Private VCN connectivity with Cloud Shell
### 4. Download the AirFlight sample data 
### 5. Running mysqlsh on Cloud Shell to import the AirFlight Data
##


1. Running MDS with Heatwave Instance on Private VCN

- Login to OCI Console and Choose DB System from MySQL
- Select the Heatwave Instance and note down the IP Address


```
Endpoint
Connect to the DB system using a MySQL client/connector via the endpoint below. How do I connect?
Private IP address: 10.x.y.z
```


2. Open Cloud Shell
- On the top right corner of OCI console menu, there is a Cloud Shell Icon.  Click on the Cloud Shell to start Terminal Access through Web Browser.

3. Set up Private VCN connectivity with Cloud Shell
This is to setup Cloud Shell networking with the MDS private subnet.  By doing so, the private IP with MDS is accessible within Cloud Shell Environment.
- Choose on the 2nd Top Left Menu with Network Label.
- Select Private Network Definition List
- Click on Create Private Network Definition
  - Fill in the NAME
  - Choose VCN (and compartment) where MDS resides in
  - Choose Subnet (and compartment) where MDS resides in
  - Click on 'Use as active network'
  - Click 'Create' button to create the definition.

(if there is existing private network definition created earlier, you can choose from the Network menu to make it as active network.)

4. Download the AirFlight data for import
- The data is located within this github repository under
  - data
    - airflight.tar
```
wget https://github.com/ivanxma/HeatwaveML-Lab/blob/main/data/airflight.tar
tar -xvf airflight.tar
```

The tar -xvf should create airflight folder which contains the sample data for import.

5. Running mysqlsh on Cloud Shell to import the AirFlight Data
Start 'mysqlsh' on OCI Cloud Shell

```
xxxxx@cloudshell:~ (us-ashburn-1)$ mysqlsh
MySQL Shell 8.0.31-commercial

Copyright (c) 2016, 2022, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > 
```

- Connect to your MDS (assuming the user to connect as admin@privateIP and provide the password which the MDS is provisioned

```
 MySQL  JS > \connect admin@privateIP
```

- Import the data
```
 MySQL ......   JS > util.loadDump('./airflight', null)
```

- Check the data if it is import successfully
```
 MySQL ......   JS > \sql
 MySQL ......   SQL > show databases;
 MySQL ......   SQL > use airflight;
 MySQL ......   SQL > show tables
```













 


