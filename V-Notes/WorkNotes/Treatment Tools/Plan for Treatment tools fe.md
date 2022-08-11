Triggers - field entry
Expectations - field entry
Feelings - field entry
Avoidance - field entry
FearLadder / Activites - rate them

Exposures - loops
Start exposure
can rate during the time
we will time stamp and rate.

Once end exposure upload results to db

Flow 
* Assessment -> && GetTriggers
	* If Triggers present decision if triggers are not the same as existing. If user decides to change triggers then push to setup
	* No triggers send to Setup
* PostTriggers -> GetExpectations
* PostExpectations -> GetFeelings
* PostFeelings -> GetAvoidance
* PostAvoidance -> GetFearLadder
* PostFearLadder -> A dashboard that allows user to start an exposure
* New exposure setup -> PostExposure
* PostExposure results - May need to be associated with other exposures. to keep track of what is being done.