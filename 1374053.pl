
fourSquares(N, [S1, S2, S3, S4]) :- Vars = [S1, S2, S3, S4],
                                    Vars ins 0..N, 
                                    S1 #=< S2, S2 #=<S3, S3 #=< S4,
                                    S1^2 + S2^2 + S3^2 + S4^2 #= N,
                                    label(Vars).