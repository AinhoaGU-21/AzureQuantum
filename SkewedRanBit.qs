import Microsoft.Quantum.Diagnostics.*;
import Microsoft.Quantum.Math.*;

operation Main() : Result {
    use q = Qubit();
    let P = 0.333333; // P is 1/3
    // Apply a rotation (around the Y-axis) to the qubit to skew the random bit generation
    // This rotation creates the state: |ψ⟩ = √P |0⟩ + √(1-P) |1⟩
    // Ry(θ) |0⟩ = cos(θ/2) |0⟩ + sin(θ/2) |1⟩
    Ry(2.0 * ArcCos(Sqrt(P)), q); // Ry(θ, q)
    Message("The qubit is in the desired state.");
    Message("");
    DumpMachine(); // Dump the state of the qubit 
    Message("");
    Message("Your skewed random bit is:");
    let skewedrandomBit = M(q);
    Reset(q);
    return skewedrandomBit;
}