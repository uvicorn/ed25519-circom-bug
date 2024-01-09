pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/bitify.circom";

template LessThanPower(base) { // in < 2^base
  signal input in;
  signal output out;

  // out <-- 1 - ((in >> base) > 0);
  out <-- 1;
  out * (out - 1) === 0;
}

template LessThanBounded(base) { // in[0] < in[1] < 2^base
  signal input in[2];
  signal output out;

  component lt1 = LessThanPower(base);
  lt1.in <== in[0];

  component lt2 = LessThanPower(base);
  lt2.in <== in[1];

  // out <-- in[0] < in[1];
  out <-- 1;
  out * (out - 1) === 0;
}
