import Microsoft.Quantum.Diagnostics.*;

// DumpMachine is used to print the current state of the quantum system (is not the same as measuring the qubit).
operation Main() : Result {
    use q = Qubit();
    Message("Initialized qubit:");
    DumpMachine(); // First dump
    Message(" ");
    H(q);
    Message("Qubit after applying H:");
    DumpMachine(); // Second dump
    Message(" ");
    let randomBit = M(q);
    Message("Qubit after the measurement:");
    DumpMachine(); // Third dump
    Message(" ");
    Reset(q);
    Message("Qubit after resetting:");
    DumpMachine(); // Fourth dump
    Message(" ");
    return randomBit;
}