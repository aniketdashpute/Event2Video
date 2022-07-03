# Event2Video
My own code to convert from event stream to video of just the event stream (binary pixel video)

# Using the code
```
EV1 = load('SampleEventData.csv');
t_integration = 10000
imgs = E2V(EV1, t_integration);
```
- After this step, check the results in the folder "results"
