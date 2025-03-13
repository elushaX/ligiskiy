
hello_world :-
    readln(X),
    format('~w',X),
    write(', Prolog is welcoming you!'), nl.
    
goal :-
    hello_world.
