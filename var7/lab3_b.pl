% Чтение числа с проверкой
read_number(N) :-
    write('Enter number: '), 
    read_line_to_string(user_input, S),
    catch(number_string(N, S), _, fail), % Преобразуем строку в число, если не получилось — fail
    number(N), !. % Проверяем, что это число

read_number(N) :- 
    write('error! enter number.'), nl,
    read_number(N). % Повторный ввод при ошибке

% Базовый случай: если введён 0, останавливаемся
sum_nums(X, Y) :-
    Sum is X + Y,
    write('Summ: '), write(Sum), nl.

startB :-
    repeat,
    read_number(X),
    read_number(Y),
    (   Y == 0    % Проверяем условие остановки
    ->  !          % Останавливаем цикл при вводе "a"
    ;   sum_nums(X, Y),
        fail       % Продолжаем цикл
    ).

% :- initialization(main).

