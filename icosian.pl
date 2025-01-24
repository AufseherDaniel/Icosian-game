%% Определение графа
edge(1, 2).
edge(1, 5).
edge(1, 6).
edge(2, 1).
edge(2, 7).
edge(2, 3).
edge(3, 2).
edge(3, 8).
edge(3, 4).
edge(4, 3).
edge(4, 9).
edge(4, 5).
edge(5, 1).
edge(5, 4).
edge(5, 10).
edge(6, 1).
edge(6, 11).
edge(6, 12).
edge(7, 2).
edge(7, 12).
edge(7, 13).
edge(8, 3).
edge(8, 13).
edge(8, 14).
edge(9, 4).
edge(9, 14).
edge(9, 15).
edge(10, 5).
edge(10, 11).
edge(10, 15).
edge(11, 6).
edge(11, 10).
edge(11, 16).
edge(12, 6).
edge(12, 7).
edge(12, 17).
edge(13, 7).
edge(13, 8).
edge(13, 18).
edge(14, 8).
edge(14, 9).
edge(14, 19).
edge(15, 9).
edge(15, 10).
edge(15, 20).
edge(16, 11).
edge(16, 17).
edge(16, 20).
edge(17, 12).
edge(17, 16).
edge(17, 18).
edge(18, 13).
edge(18, 17).
edge(18, 19).
edge(19, 14).
edge(19, 18).
edge(19, 20).
edge(20, 15).
edge(20, 16).
edge(20, 19).

hamiltonianCycles([], _, []).
hamiltonianCycles([H|T], N, [PathsForH|RestPaths]) :- findall(Path, hamiltonian_cycle(H,N, Path), PathsForH), hamiltonianCycles(T, N, RestPaths).

hamiltonianCycle(Start,N, AllPath):- findall(Path,hamiltonian_cycle(Start,N, Path),AllPath).

%%Поиск гамильтонова цикла
hamiltonian_cycle(Start,N, [Start|Path]) :- way(Start, Start, N, [], Path).

way(Start, Node, C, Visited, [Node|Visited]) :- length(Visited, N),N =:= C,edge(Node, Start).
way(Start, Node, C, Visited, Path) :- length(Visited, N),N < C,edge(Node, Next),not(member(Next, Visited)),way(Start, Next, C, [Node|Visited], Path).

%%set_prolog_flag(toplevel_print_options, [max_depth(0)]).
%%hamiltonianCycles([a,b,c,d],3,Solutions).
%%hamiltonianCycle(a,3,Solutions).
%%hamiltonianCycle(1,19,Solutions).
%%hamiltonianCycles([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],19,Solutions).