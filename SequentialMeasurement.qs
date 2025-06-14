import Microsoft.Quantum.Diagnostics.*;
import Microsoft.Quantum.Measurement.*;
import Microsoft.Quantum.Math.*;
import Microsoft.Quantum.Convert.*;


// Like ThreeQubitSuperposition.qs,  but measures each qubit one by one
// and shows how the quantum state collapses after each measurement.
operation Main() : Int {
    use qubits = Qubit[3];
    ApplyToEach(H, qubits);
    Message("The qubit register in a uniform superposition: ");
    DumpMachine();
    mutable results = [];
    for q in qubits {
        Message(" ");
        set results += [M(q)];
        DumpMachine();
    }
    Message(" ");
    Message("Your random number is: ");
    ResetAll(qubits);
    return BoolArrayAsInt(ResultArrayAsBoolArray(results));
}