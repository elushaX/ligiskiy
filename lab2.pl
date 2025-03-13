% Определение фактов
man("Tom").
man("Bob").
man("Bill").
man("Nil").
man("Red").

woman("Pat").
woman("Pamela").
woman("Djein").
woman("Linda").
woman("Liz").
woman("Emmi").
woman("Djin").
woman("Enn").


% Отношения родителей и детей
parent("Pamela", "Bob").
parent("Tom", "Bob").
parent("Tom", "Liz").
parent("Djein", "Liz").
parent("Bob", "Nil").
parent("Linda", "Nil").
parent("Bob", "Pat").
parent("Linda", "Pat").
parent("Liz", "Red").
parent("Bill", "Red").
parent("Pat", "Djin").
parent("Emmi", "Djin").
parent("Pat", "Enn").
parent("Emmi", "Enn").


% Правила
is_mother_of(X, Y) :- woman(X), parent(X, Y).
is_father_of(X, Y) :- man(X), parent(X, Y).

% Исправлено правило для определения сестры
is_sister_of(X, Y) :- woman(X), parent(Z, X), parent(Z, Y), X \= Y.

% Правила для определения предков и потомков
is_ascended_of(X, Y) :- parent(X, Y).
is_ascended_of(X, Y) :- parent(X, Z), is_ascended_of(Z, Y).

is_descendant_of(X, Y) :- parent(Y, X).
is_descendant_of(X, Y) :- parent(Z, X), is_descendant_of(Z, Y).

% Шурин (брат жены)
is_brother_in_law(X, Y) :- 
    man(X),                  % X – мужчина
    is_sister_of(W, X),       % W – сестра X
    is_wife_of(W, Y).         % Y – муж W

% Зять (муж дочери или муж сестры)
is_son_in_law(X, Y) :- 
    man(X),                  % X – мужчина
    is_wife_of(W, X),        % W – жена X
    parent(Y, W).            % Y – родитель W

% Дополнительное правило для определения жены
is_wife_of(W, H) :- 
    woman(W), man(H),
    parent(W, C), parent(H, C). % У них есть общий ребенок
    
% Правило для определения двоюродных сестёр
is_cousin_sister_of(X, Y) :- 
    parent(P1, X), parent(P2, Y),    % У X и Y есть родители P1 и P2 соответственно
    parent(G, P1), parent(G, P2),    % У P1 и P2 есть общий родитель G (бабушка или дедушка X и Y)
    P1 \= P2,                        % Родители P1 и P2 не должны быть одним и тем же человеком
    woman(Y),                        % Y должна быть женщиной
    X \= Y.                          % X и Y не должны быть одним и тем же человеком

