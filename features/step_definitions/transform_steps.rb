Fabrication::Transform.define(:goal, lambda{ |goal_title| Goal.where(title: goal_title).first })

Fabrication::Transform.define(:plan, lambda{ |plan_title| Plan.where(title: plan_title).first })
