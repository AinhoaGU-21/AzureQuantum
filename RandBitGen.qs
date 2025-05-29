// Simple quantum random bit generator using Q#

// Define function main (main operation)
// Returns a result type (quantum measurement result)
operation Main(): Result {
    // Create a qubit in the |0⟩ state
    use qubit = Qubit();
    // Apply a Hadamard gate to put the qubit into a superposition state
    // Now it has equal probability of being measured as |0⟩ or |1⟩
    H(qubit);
    // Measure the qubit in the z-axis (computational basis)
    // This collapses the superposition to either |0⟩ or |1⟩
    let result = M(qubit);
    // Reset the qubit to the |0⟩ state before releasing it
    Reset(qubit);

    return result;
}