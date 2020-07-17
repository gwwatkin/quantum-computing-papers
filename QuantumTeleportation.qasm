OPENQASM 2.0;
include "qelib1.inc";

// Complete description, comments and reference are given in the
// main PDF of the assignment.

qreg q[3];
creg c[5];


// Entangle a Bell pair. 1 is Alice's 2 is Bob's
h q[1];
cx q[1],q[2];

// Create a non trivial state in q[0] (Alice wants to send ot Bob)
h q[0];
t q[0];
h q[0];

// Alice's  part of the teleportation
cx q[0],q[1];
h q[0];
measure q[0] -> c[0]; // She lost the state forever!
measure q[1] -> c[1];

// Bob's recovery of the state with the help of the classical bits
if (c==1) z q[2];
if (c==2) x q[2];
if (c==3) z q[2];
if (c==3) x q[2];

// q[2] now holds the non trivial state Alice wanted to transfer
measure q[2] -> c[2];
