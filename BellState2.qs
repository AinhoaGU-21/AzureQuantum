import Std.Diagnostics.DumpMachine;
import Microsoft.Quantum.Diagnostics.*;

// Bell State 2 (|00⟩ - |11⟩)/√2)

operation Main() : (Result, Result) {
    // Take two qubits in the state |0⟩ .The first qubit is the control qubit and the second qubit is the target qubit.
    use (q1, q2) = (Qubit(), Qubit());
    // Apply a Hadamard gate to the first qubit to create superposition.
    // The Hadamard gate transforms |0⟩ to (|0⟩ + |1⟩)/√2.
    H(q1);
    Z(q1); // Apply a Z gate to the first qubit to create a negative phase for the |11⟩ state.
    // CNOT operation acts on an array of two qubits, and it flips the second qubit if the first qubit is One (entangles the two qubits).
    CNOT(q1, q2);

    DumpMachine();

    let (m1, m2) = (M(q1), M(q2));
    Reset(q1);
    Reset(q2);

    return (m1, m2);
}