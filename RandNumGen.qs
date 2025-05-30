import Std.Convert.ResultArrayAsInt;
import Microsoft.Quantum.Convert.*;
import Microsoft.Quantum.Math.*;

operation Main(): Int {
    let max = 100;
    let min = 10;
    Message($"Generating a random number in the range [0, {max}]...");
    return GenerateRandomNumber(max, min);
}
operation GenerateRandomBit(): Result {
    use q = Qubit();
    H(q);
    let result = M(q);
    Reset(q);
    return result;
}

// Generates a random number in the range [min, max].
operation GenerateRandomNumber(max: Int, min: Int): Int {

    mutable bits = []; // Empty mutable array to store the randomly generated bits.
    let nBits = BitSizeI(max); // Number of bits needed to represent the maximum value.
    // Loop to generate the required number of bits. 1..7 means 1,2,3,4,5,6,7 --> 1..nBits means 1,2,3,...,nBits
    for i in 1..nBits {
        set bits += [GenerateRandomBit()];
    }

    let sample = ResultArrayAsInt(bits);

    return (sample > max or sample < min) ? GenerateRandomNumber(max, min) | sample;
}