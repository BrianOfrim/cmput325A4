:- use_module(library(clpfd)).

fourSquares(N, [S1, S2, S3, S4]) :- Vars = [S1, S2, S3, S4],
                                    Vars ins 0..N, 
                                    S1 #=< S2, S2 #=<S3, S3 #=< S4,
                                    S1^2 + S2^2 + S3^2 + S4^2 #= N,
                                    label(Vars).





xappend(L,L2) :- append(L, [1,2],L2).

selectOne([],[],L). 
disarm(A,B,L) :-
    Vars = [B1, A_1 ,A1 ,B_1 ,A2 ,B_2],
    member(B1,B),
    member(A1,A),
    member(A2,A),
    member(A_1, A),
    member(B_1, B),
    member(B_2, B),
    B1 #= A1 + A2,
    A_1 #= B_1 + B_2,
    label(Vars),
    B1 =< A_1,
    select(B1,B,C),
    select(A1,A,D),
    select(A2,D,E),
    append([[[A1,A2],[B1]]], L2, L),
    selectOne(E,C,L2).


disarm(A,B,L) :-
    Vars = [A1,B1,B2],
    member(A1,A),
    member(B1,B),
    member(B2,B),
    A1 #= B1 + B2,
    label(Vars),
    select(A1,A,C),
    select(B1,B,D),
    select(B2,D,E),
    append([[[A1],[B1,B2]]], L2, L),
    selectOne(C,E,L2).

disarm(A,B,L) :-
    Vars = [B1,A1,A2],
    member(B1,B),
    member(A1,A),
    member(A2,A),
    B1 #= A1 + A2,
    label(Vars),
    select(B1,B,C),
    select(A1,A,D),
    select(A2,D,E),
    append([[[A1,A2],[B1]]], L2, L),
    selectOne(E,C,L2).

    


