USE: tools.test
USE: shokunin-july-home-schooling

{ t } [ H{ { "A" 1 } { "B" 2 } { "C" 3 } } divisible-by-3? ] unit-test
{ t } [ H{ { "A" 1 } { "B" 2 } { "C" 3 } { "A2" 1 } { "B2" 2 } { "C2" 3 } } divisible-by-3? ] unit-test
{ t } [ H{ { "A" 1 } { "B" 2 } } divisible-by-3? ] unit-test
{ f } [ H{ { "A" 4 } } divisible-by-3? ] unit-test

{ t } [ H{ { "A" 1 } { "B" 2 } { "C" 3 } } enough-tasks? ] unit-test
{ f } [ H{ { "A" 1 } { "B" 2 } } enough-tasks? ] unit-test
{ t } [ H{ { "A" 1 } { "B" 2 } { "C" 3 } { "D" 0 } } enough-tasks? ] unit-test

{ 2 } [ H{ { "A" 1 } { "B" 2 } { "C" 3 } } bucket-size ] unit-test
{ 4 } [ H{ { "A" 1 } { "B" 2 } { "C" 3 } { "A2" 1 } { "B2" 2 } { "C2" 3 } } bucket-size ] unit-test
{ 1 } [ H{ { "A" 1 } { "B" 2 } } bucket-size ] unit-test

{ t } [ H{ { "A" 1 } { "B" 2 } { "C" 3 } } tasks-exceeding-bucket-size? ] unit-test
{ f } [ H{ { "A" 1 } { "B" 2 } { "C" 2 } { "D" 1 } } tasks-exceeding-bucket-size? ] unit-test

{ H{ { "Child 1" { { "A2" 6 } } } { "Child 2" { { "C2" 5 } } } { "Child 3" { { "B2" 4 } } } } } [ H{ { "A" 1 } { "B" 2 } { "C" 3 } { "A2" 6 } { "B2" 4 } { "C2" 5 } } allocate-tasks ] unit-test
