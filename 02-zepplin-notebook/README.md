# This Lab Session is to use Zepplin as UI interface
# to work with Heatwave AutoML


1. Start Web Browser and login to Zeppline 
- e.g. http://<public ip>/zepplin/

2. Create NoteBook with INTERPRETER created with previous exercise to work with Heatwave
- On the top menu bar, Choose Notebook and select 'Create a new note'
  - fill up with name
  - choose Interpreter with MySQL Heatwave

3. SELECT on the airflight training data 
```
use airflight;
select * from airlines_train limit 10;
select count(*) from airlines_train;
```

4. Train the model with the training data
```
select @modelname:='flightmodel';
call sys.ML_TRAIN('airflight.airlines_train', 'Delay',JSON_OBJECT('task', 'classification'),@modelname);
```

5. Load the model
```
select @modelname:='flightmodel';
call sys.ML_MODEL_LOAD(@modelname, null);
```


6. Exploring the ML_SCHEMA_<user>.MODEL_CATALOG for the trained model information
The table ML_SCHEMA_<user>.MODEL_CATALOG stores all the models with the user.   The previous example with given model handle can be retrieved withe critia model_handle=@modelname.

```
select @modelname:='flightmodel';
select * from ML_SCHEMA_admin.MODEL_CATALOG where model_handle=@modelname;
select * from airlines_test;
```

7. Predict a given flight data
```
select @modelname:='flightmodel';
select @myrow:=JSON_OBJECT("Airline", "DL", "Flight", "1002", "AirportFrom", "SLC", "AirportTo", "JFK", "DayOfWeek", "5", "Time", "1425", "Length", "264"  );
select sys.ML_PREDICT_ROW( @myrow, @modelname,null);
```

Check the output where the JSON containing "ml_results":{prediction: {"Delay":?}, probabilities:{"0":0.xxx, "1":0.yy}}

8. Explain the model
```
select sys.ML_EXPLAIN_ROW(@myrow, @modelname,
JSON_OBJECT('prediction_explainer', 'permutation_importance'))
```

9. Test and Validate
```
CALL sys.ML_SCORE('airflight.airlines.test', 'delay', @modelname, 'balanced_accuracy', @score,null);
select @score
```

Interpret the result based on the meric.   (Ref : https://dev.mysql.com/doc/heatwave/en/mys-hwaml-ml-score.html)
- classification metrics:
  * accuracy: Computes the fraction of labels a model predicts correctly
  * balanced_accuracy: Computes the balanced accuracy for imbalanced datasets
  * precision: Computes precision
  * recall: Computes the recall
  * f1: Computes the F1 score
  * f1_micro: Computes the F1 score (micro-averaged)
  * f1_macro: Computes the F1 score (macro-averaged)
  * f1_weighted: Computes the F1 score (weighted)
  * f1_samples: Computes the F1 score (by multilabel sample)
  * recall_micro: Computes the recall (micro-averaged)
  * recall_macro: Computes the recall (macro-averaged)
  * recall_weighted: Computes the recall (weighted)
  * recall_samples: Computes the recall (by multilabel sample)
  * precision_micro: Computes precision (micro-averaged)
  * precision_macro: Computes precision (macro-averaged)
  * precision_weighted: Computes precision (weighted)
  * precision_samples: Computes precision (by multilabel sample)



