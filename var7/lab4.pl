% Читаем слово из ввода
read_word(Word) :-
    write('Введите слово: '),
    read_line_to_string(user_input, Word).

% Удаляем первую и последнюю буквы, если длина больше 2
trim_word(Word, Trimmed) :-
    string_length(Word, Len),
    Len > 2, % Проверяем, что слово длиннее 2 символов
    sub_string(Word, 1, _, 1, Trimmed).

% Основной цикл с повторным вводом при коротком слове
words :-
    repeat,
    read_word(Word),
    (   trim_word(Word, Trimmed)
    ->  write('Result: '), write(Trimmed), nl, !
    ;   write('error: word must be longer than two letters!'), nl, fail
    ).

%:- initialization(main).