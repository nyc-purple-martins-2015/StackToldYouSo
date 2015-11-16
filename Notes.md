Code Review

Good Work!
==========
**WHOA** you've successfully dodged the N + 1 queries bug.  NEXT LEVEL.

    QuestionTag Load (0.5ms)  SELECT "question_tags".* FROM "question_tags" WHERE
    "question_tags"."question_id" IN (20, 19, 18, 17, 16, 15
    , 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)


Constraints
===========

Be careful about adding constraints
