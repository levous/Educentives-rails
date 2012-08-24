[Twitter bootstrap for easy, slick responsive design](http://twitter.github.com/bootstrap)

NEED TODO:
modified the goal to default the plan so that the wizard is not duplicating goal controller logic
However, the student associated with the goal's plan needs to be assigned.  current_user is not available in the model
So we need to pass the user into the goal.create method.  This makes sense. In both use cases, the goal's pursuer is known so should be passed in

