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
do(X, Y) :-
    Res is X * Y,
    write('Сумма: '), write(Res), nl.

startB :-
    repeat,
    read_number(X),
    read_number(Y),
    (   Y == 1    % Проверяем условие остановки
    ->  !          % Останавливаем цикл при вводе "a"
    ;   do(X, Y),
        fail       % Продолжаем цикл
    ).

% :- initialization(main).

