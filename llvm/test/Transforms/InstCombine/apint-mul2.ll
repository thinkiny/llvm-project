; This test makes sure that mul instructions are properly eliminated.
; This test is for Integer BitWidth >= 64 && BitWidth % 2 >= 1024.
;

; RUN: llvm-as < %s | opt -instcombine | llvm-dis | not grep mul

implementation

define i177 @test1(i177 %X) {
    %C = shl i177 1, 155
    %Y = mul i177 %X, %C
    ret i177 %Y
} 
