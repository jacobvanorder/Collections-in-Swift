//: # Sequences
// Multiples
struct Multiples: SequenceType {
    let multiple: Int
    let max: Int
    
    // generator()
    func generate() -> MultiplesGenerator {
        return MultiplesGenerator(self)
    }
}

// MultiplesGenerator
struct MultiplesGenerator: GeneratorType {
    let multiples: Multiples
    var current = 0
    
    init(_ multiples: Multiples) {
        self.multiples = multiples
    }
    
    // next()
    mutating func next() -> Int? {
        current += multiples.multiple
        if current > multiples.max {
            return nil
        }
        return current
    }
}

let lotsOfFives = Multiples(multiple: 5, max: 100)

//Fibonacci
struct Fibonaccis: SequenceType {
    var nextNumber = 1
    let max: Int
    
    func generate() -> FibonacciGenerator {
        return FibonacciGenerator(self)
    }
}

//FibonacciGenerator
struct FibonacciGenerator: GeneratorType {
    var fibonaccis: Fibonaccis
    var current = 0
    
    init(_ fibonaccis: Fibonaccis) {
        self.fibonaccis = fibonaccis
    }
    
    mutating func next() -> Int? {
        let previous = current //1
        current = fibonaccis.nextNumber //2
        fibonaccis.nextNumber = (current + previous)
        if current <= fibonaccis.max {
            return current
        }
        return nil
    }
}

let fib = Fibonaccis(nextNumber: 1, max: 144)
//: ## Iteration
for number in lotsOfFives {
    number
}

for number in fib {
    number
}

let fivesArray = Array(lotsOfFives)

let fibArray = Array(fib)
//: ## Finding Elements
lotsOfFives.contains(15)

lotsOfFives.contains(19)

lotsOfFives.minElement()

lotsOfFives.maxElement()

//: ## Subsequences

let subsequence = lotsOfFives.dropFirst(3)
for number in subsequence {
    number
}

let subsubsequence = lotsOfFives.dropFirst(3).prefix(5)
for number in subsubsequence {
    number
}

let fibSubsequence = fib.dropFirst(3)

for number in fibSubsequence {
    number
}

//: ## Functional Methods

let tripledFives = lotsOfFives.map { $0 * 3 }
for number in tripledFives {
    number
}


let oddMultiples = lotsOfFives.filter { $0 % 2 != 0 }
for number in oddMultiples {
    number
}

//: ## Permutations

let reversed = lotsOfFives.reverse()
for number in reversed {
    number
}


let unreversed = reversed.sort()
for number in unreversed {
    number
}

