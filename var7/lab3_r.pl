% Чтение числа с проверкой
read_number(N) :-
    write('Введите число: '), 
    read_line_to_string(user_input, S),
    catch(number_string(N, S), _, fail), % Преобразуем строку в число, если не получилось — fail
    number(N), !. % Проверяем, что это число

read_number(N) :- 
    write('Ошибка! Введите число.'), nl,
    read_number(N). % Повторный ввод при ошибке

% Базовый случай: если введён 0, останавливаемся
sum_until_zero(_, 0) :- !.

% Рекурсивное сложение
sum_until_zero(X, Y) :- 
    Sum is X + Y,
    write('Сумма: '), write(Sum), nl,
    read_number(A), read_number(B),
    sum_until_zero(A, B).

% Точка входа
start :- 
    read_number(X), read_number(Y),
    sum_until_zero(X, Y).

% :- initialization(main).
