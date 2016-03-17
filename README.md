# Appointment API

This is an Appointment API used for creating and maintaining appointments. This follows CRUD, allowing you to create, read(or list), update, or destroy entries. Ruby on Rails is the technology used in this api. This api allows the user to input data in different forms.

### Making a GET request

A get request can be made right from the URL's root

GET ``` https://salty-atoll-61628.herokuapp.com/ ```

or with ``` /appointments ``` end point

GET ``` https://salty-atoll-61628.herokuapp.com/appointments ```

#### Allows searches with start and end times

GET ``` https://salty-atoll-61628.herokuapp.com/ ``` with ``` ?start_time=5:00 ```

### Making a POST request

Post requests can be made in most any format. Times that are allowed are any current time or any time in the future.
Valid fields are as follows:
``` first_name, last_name, start_time, end_time, day, month, year ```

#### sample

```
POST https://salty-atoll-61628.herokuapp.com/appointments
  -H 'Content-type' => 'application/json'
  -d {appointment: {first_name: :Nicholas, last_name: :Sellek, start_time: '5:15pm', end_time: '5:45pm', day: :5, month: :jun, year: :2016}}
```

### Making a PATCH request

\#\#\# This is destructive \#\#\#
\# Once done can't be undone \#

In order to make the patch request you need the id of the entry you are trying to update.

#### sample

```
PATCH https://salty-atoll-61628.herokuapp.com/appointments/1
  -H 'Content-type' => 'application/json'
  -d {appointment: {start_time: '5:00pm'}}
```

### Making a DELETE request

\#\#\# Highly distructive \#\#\#
\# Once done can't be undone \#

An id is needed to find the appointment to remove

#### sample

```
DELETE https://salty-atoll-61628.herokuapp.com/appointments/1
```




