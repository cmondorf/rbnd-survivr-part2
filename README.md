# Changes to Survivr2
----

## jury.rb:

- `finalists.sample` now stored in the `sampled_finalist` variable.
- `@`added to members variable name on line 18, as suggested
- `report_votes`no longer failing. Adding color throws off the test definitions.
- `announce_winner`same as above
-

## game.rb

- `@tribes.first.members.sample` suggestion implemented
- `individual_immmunity_challenge_2` removed and corrected.
-

## survivr.rb

- now using `tribal_council`to extract the immune member and add them to the jury.

## tribe.rb

- "eliminate" method removed, replaced with updated `tribal_council`
- tribal council method folded into phases one and two




------

This document was last updated 1st May 2016.
