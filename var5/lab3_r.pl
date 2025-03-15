% Чтение числа с проверкой
read_number(N) :-
    write('Enter number: '), 
    read_line_to_string(user_input, S),
    catch(number_string(N, S), _, fail), % Преобразуем строку в число, если не получилось — fail
    number(N), !. % Проверяем, что это число

read_number(N) :- 
    write('Erorr! Enter number.'), nl,
    read_number(N). % Повторный ввод при ошибке

% Базовый случай: если введён 0, останавливаемся
do(_, 1) :- !.

% Рекурсивное сложение
do(X, Y) :- 
    Res is X * Y,
    write('Summ: '), write(Res), nl,
    read_number(A), read_number(B),
    do(A, B).

% Точка входа
start :- 
    read_number(X), read_number(Y),
    do(X, Y).

% :- initialization(main).
