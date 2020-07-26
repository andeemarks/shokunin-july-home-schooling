! Copyright (C) 2020 Your name.
! See http://factorcode.org/license.txt for BSD license.

USE: io
USE: math
USE: sequences
USE: kernel
USE: assocs
USE: sorting
USE: help
USE: help.markup
USE: help.syntax
USE: json.prettyprint

IN: shokunin-july-home-schooling

! H{ { "A" 5 } { "B" 4 } { "C" 1 } { "D" 2 } { "E" 7 } { "F" 8 } { "G" 3 } }

<PRIVATE

: task-sizes ( tasks -- n ) values ;
: sum-of-tasks ( tasks -- n ) task-sizes 0 [ + ] reduce ;
: biggest-task ( tasks -- n ) task-sizes natural-sort last ;

PRIVATE>

: divisible-by-3? ( tasks -- ? ) sum-of-tasks 3 mod 0 = ;
HELP: divisible-by-3?
{ $values { "tasks" assoc } { "?" boolean } }
{ $description "Returns true if tasks values are evenly divisible by 3, false otherwise." } ;
\ divisible-by-3? help

: enough-tasks? ( tasks -- ? ) assoc-size 3 >= ;
HELP: enough-tasks?
{ $values { "tasks" assoc } { "?" boolean } }
{ $description "Returns true if there are at least 3 items in tasks, false otherwise." } ;
\ enough-tasks? help

: bucket-size ( tasks -- n ) sum-of-tasks 3 /i ;
HELP: bucket-size
{ $values { "tasks" assoc } { "n" integer } }
{ $description "Returns the size of the tasks allocated to each child" } ;
\ bucket-size help

: tasks-exceeding-bucket-size? ( tasks -- ? ) [ biggest-task ] [ bucket-size ] bi > ;
HELP: tasks-exceeding-bucket-size?
{ $values { "tasks" assoc } { "?" boolean } }
{ $description "Returns true if any of the tasks is larger than the maximum task allocation (i.e., the bucket), false otherwise." } ;
\ tasks-exceeding-bucket-size? help

: check-tasks ( tasks -- output ) [ divisible-by-3? ] [ enough-tasks? ] [ tasks-exceeding-bucket-size? not ] tri and [ "Yes" print ] [ "No" print ] if ;
HELP: check-tasks
{ $values { "tasks" assoc } { "output" "Displays No if the tasks are not allocatable evenly, Yes otherwise."} }
{ $description "Prints a message indicating whether the tasks seem suitable for home schooling." } ;
\ check-tasks help

: allocate-tasks ( tasks -- output ) [ check-tasks ] [ pprint-json ] bi ;
HELP: allocate-tasks
{ $values { "tasks" assoc } { "output" "Displays No if the tasks are not allocatable evenly, Yes (with the task allocation) otherwise."} }
{ $description "Take any given list of tasks with associated points and outputs 'No' if the tasks can't be split with points divided evenly between the three children; and outputs 'Yes' plus the tasks with points for each child if they can." } ;
\ allocate-tasks help

! MAIN: allocate-tasks
