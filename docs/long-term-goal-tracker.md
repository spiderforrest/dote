# long-term ADHD-focused goal tracker

potentially named "goaltree" or something like that, for its structure

(likely CLI) application that allows users to set long-term goals, along with medium and short-term goals for themselves, also lets you check off goals and make sub-goals

## details of basic functionality
- first, establish a long-term goal, like "learn guitar", "get better at writing", etc
  - goals must have `endpoints`, a text desc of the point at which goals are achieved: `string`
    - for long-term goals, this can be more general, the important part is breaking goals down into actionable substeps
  - may optionally have `startpoints`, text description of your current skill level or starting status in regards to goal: `string`
  - goals must also have ETAs or "due dates" (though maybe call them something less anxiety-inducing): `date`
  - goals also store start dates: `date`
  - goals store whether achieved, and if achieved, when: 
- after that, make sub-goals; "be able to play this particular guitar song" or "write two poems a week" or something 
  - subgoals are just goals nested in goals: they have endpoints, startpoints, due dates, etc

## that's the basic format but more features to help you to stick to trying to achieve your goals would be nice
- (these features are all unsorted and just brainstorm output)
- easy goal list/tree display mode that shows goals, including completed subgoals!!
- "progress over time" display mode that shows calendar/timeline and when you've completed stuff and what periods you've been working on what over time so you can get a sense of how long doing stuff takes and what you've spent your time on for the past six months
- the software is nice to you and compliments you on completing goals so you feel nice about yourself
- "daily" display mode that shows your current subgoals so you can see at a glance what you should work towards
- doc/walkthrough that explains how to use software but ALSO gives recommendations in regards to realistic goal-setting, time allocation, for those of us like me who struggle with being realistic
- icon library for goals
- notifications/updates periodically that reminds you of your goal status, and what your current subgoals are
- attitude tracking system for goals?? like a 1-5 scale you respond to to gauge how you feel about your progress over time
- ability to attach arbitrary data to goals?? images, text, vids, etc
  - could also be in context of journaling system? so software also tracks journal entries related to goals
- levelling system??? skinner box used positively babeee
  - ui skins for levelling rewards or something lol
- when making long/medium term goals, app encourages you to set subgoals
- combine with chore-like todo system?? potential details of this nested
  - hard and soft targets: hard targets are "I have to pay this bill by this date bc it's due then" and soft targets are "I would like to achieve this by this date but nothing will explode if I don't"
- ability to store paths to particular files relevant to goals so you can quickly nav to them from goal app
