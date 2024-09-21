pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  
   signal input a_input;
   signal input b_input;

   signal X_intermeditate;
   signal Y_intermediate;

   signal output Q_final;

   component and--gate=AND();
   component or--gate=OR();
   component not--gate=NOT();

   and--gate.a <== a_input ;
   and--gate.b <== b_input ;
   X_intermeditate; <== and--gate.out ;

   not--gate.in <== b_input ;
   Y_intermeditate; <== not--gate.out;

   or--gate.a <== X_intermeditate;;
   or--gate.b <== Y_intermeditate;;
   Q_final <== or--gate.out;

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
