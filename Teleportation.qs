import Microsoft.Quantum.Diagnostics.*;
import Microsoft.Quantum.Intrinsic.*;
import Microsoft.Quantum.Measurement.*;

operation Main() : Result[] {
    // Allocate the message and bob qubits.
    use (message, bob) = (Qubit(), Qubit());

    // Use the `Teleport` operation to send different quantum states.
    let stateInitializerBasisTuples = [
        ("|0〉", I, PauliZ),
        ("|1〉", X, PauliZ),
        ("|+〉", SetToPlus, PauliX),
        ("|-〉", SetToMinus, PauliX)
    ];

    mutable results = [];
    for (state, initializer, basis) in stateInitializerBasisTuples {
        // Initialize the message and show its state using the `DumpMachine`
        // function.
        initializer(message);
        Message($"Teleporting state {state}");
        DumpMachine();

        // Teleport the message and show the quantum state after
        // teleportation.
        Teleport(message, bob);
        Message($"Received state {state}");
        DumpMachine();

        // Measure bob in the corresponding basis and reset the qubits to
        // continue teleporting more messages.
        let result = Measure([basis], [bob]);
        set results += [result];
        ResetAll([message, bob]);
    }

    return results;
}

operation Teleport(message : Qubit, bob : Qubit) : Unit {
        // Allocate an alice qubit.
        use alice = Qubit();

        // Create some entanglement that we can use to send our message.
        H(alice);
        CNOT(alice, bob);

        // Encode the message into the entangled pair.
        CNOT(message, alice);
        H(message);

        // Measure the qubits to extract the classical data we need to decode
        // the message by applying the corrections on the bob qubit
        // accordingly.
        if M(message) == One {
            Z(bob);
        }
        if M(alice) == One {
            X(bob);
        }

        // Reset alice qubit before releasing.
        Reset(alice);
    }

    /// Sets a qubit in state |0⟩ to |+⟩.
    operation SetToPlus(q : Qubit) : Unit is Adj + Ctl {
        H(q);
    }

    /// Sets a qubit in state |0⟩ to |−⟩.
    operation SetToMinus(q : Qubit) : Unit is Adj + Ctl {
        X(q);
        H(q);
    }