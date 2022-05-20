initial begin
    #5;//5
    fork
        #9;//14
        begin
            #9;//14
            #9;//23
            fork
            #4;//27
            #6;//29
            join
        end
        #16 //* 21
    join
end
