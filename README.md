# HeatwaveML-Lab
HeatwaveML Lab

This Lab is to introduce the Heatwave AutoML for Airflight Demo.

Reference : https://github.com/oracle-samples/heatwave-ml/

- The github repository shares many sample data for AutoML testing.

This Lab uses ONLY the airflight sample data.  With Zepplines as tools to interact with the MDS Heatwave AutoML.

1. Data Import
A sample dump file is prepared.  This is a ready to use 'dump' for airflight sample data.
You are required to import the data using mysqlsh on OCI Cloud Shell.   Please follow the instruction with 01-Import folder.


2. Access to Heatwave AutoML using Zeppline

3. Training the airflight data
The model is to created thru sys.ML_TRAIN on airflight.airlines_train which it has over 25K rows of data.   The model is to determines the flight delay based on the airline flight data.


4. Load The Model
Once the model is created.   It is registered within the ML_SCHEMA_admin.MODEL_CATALOG.   The table contains the models which are created under the user 'admin'.    

5. Predict and Test the model
A table with 20 entries is created which is a known dataset.   It is used to test and validate the model and determine the score of the model.

Calling sys.ML_PREDICT_TABLE to create 




