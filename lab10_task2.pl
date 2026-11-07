% Task 2: Login System

% User database
user(lujain, 1234).
user(sara, 5678).
user(nora, 1111).

% Start login
login :-
    login_attempt(3).

% Check login attempts
login_attempt(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    check_login(Username, Password, Attempts).

% Successful login
check_login(Username, Password, _) :-
    user(Username, Password),
    !,
    write('Login Successful'), nl.

% Failed login
check_login(_, _, Attempts) :-
    write('Login Unsuccessful'), nl,
    Remaining is Attempts - 1,
    ( Remaining > 0 ->
        login_attempt(Remaining)
    ;
        write('Sorry, you exceeded the maximum number of attempts, try again later.'),
        nl
    ).
