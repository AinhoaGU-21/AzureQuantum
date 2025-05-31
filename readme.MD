# Quantum Computing with Q# - Azure Quantum Learning Path

This repository contains implementations of quantum computing exercises and examples from Microsoft's "Get started with Azure Quantum" learning path (all credit for the original exercises goes to Microsoft).

### Basic Quantum Programs
- **[`RandBitGen.qs`](RandBitGen.qs)** - Simple quantum random bit generator using superposition
- **[`RandNumGen.qs`](RandNumGen.qs)** - Quantum random number generator for a specified range
- **[`SkewedRanBit.qs`](SkewedRanBit.qs)** - Biased random bit generator using Y-rotation
- **[`DumpMachineTest.qs`](DumpMachineTest.qs)** - Demonstrates quantum state visualization with `DumpMachine()`

### Quantum Superposition and Measurement
- **[`ThreeQubitSuperposition.qs`](ThreeQubitSuperposition.qs)** - Creates uniform superposition across 3 qubits
- **[`SequentialMeasurement.qs`](SequentialMeasurement.qs)** - Shows quantum state collapse during sequential measurements

### Quantum Entanglement
- **[`BellState1.qs`](BellState1.qs)** - Creates Bell state (|00⟩ + |11⟩)/√2
- **[`BellState2.qs`](BellState2.qs)** - Creates Bell state (|00⟩ - |11⟩)/√2

### Quantum Teleportation
- **[`Teleportation.qs`](Teleportation.qs)** - Implements quantum teleportation protocol for various quantum states

### Resource Estimation
- **[`ResourceEstimator.ipynb`](ResourceEstimator.ipynb)** - Jupyter notebook demonstrating Azure Quantum Resource Estimator for simple quantum programs
- **[`ShorRE.ipynb`](ShorRE.ipynb)** - Resource estimation for Shor's algorithm implementation, comparing different qubit technologies and error correction schemes


**Original Source**: [Microsoft Learn - Get started with Azure Quantum](https://docs.microsoft.com/en-us/learn/paths/quantum-computing-fundamentals/)