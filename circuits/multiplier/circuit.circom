pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  
   signal input A;
   signal input B;
   signal X;
   signal Y;
   signal output Q;

   component AND=AND();
   component OR=OR();
   component NOT=NOT();

   AND.a <== A ;
   AND.b <== B ;
   X <== AND.out ;

   NOT.in <== B ;
   Y <== NOT.out;

   OR.a <== X;
   OR.b <== Y;
   Q <== OR.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
