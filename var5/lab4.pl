% Читаем строку из ввода
read_sentence(Sentence) :-
    write('Enter sentence: '),
    read_line_to_string(user_input, Sentence).

% Разбиваем предложение на список слов
split_sentence(Sentence, Words) :-
    split_string(Sentence, " ", "", Words).

% Удаляем первое и последнее слово, если в списке больше 2 слов
trim_sentence(Words, TrimmedSentence) :-
    length(Words, Len),
    Len > 2,                          % Проверяем, что слов больше двух
    [_|Middle], append(Middle, [_], Words), % Отбрасываем первое и последнее
    atomic_list_concat(Middle, " ", TrimmedSentence). % Объединяем слова обратно

% Основной цикл с повторным вводом при ошибке
asd :-
    repeat,
    read_sentence(Sentence),
    split_sentence(Sentence, Words),
    (   trim_sentence(Words, Trimmed)
    ->  write('Result: '), write(Trimmed), nl, !
    ;   write('Error: sentence must have more than two words!'), nl, fail
    ).

%:- initialization(main).