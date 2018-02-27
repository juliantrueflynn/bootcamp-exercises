console.log(`
    Phase I - JS Fundamentals
    -------------------------------------
`);

/*
  #1: Madlib
*/
function madLib(verb, adj, noun) {
    const verbUpcase = verb.toUpperCase();
    const adjUpcase = adj.toUpperCase();
    const nounUpcase = noun.toUpperCase();

    return `We ${verbUpcase} the ${adjUpcase} ${nounUpcase}`;
}


console.log(madLib("make", "best", "guac")); // "We MAKE the BEST GUAC."
console.log("");

/*
  #2: isSubstring
*/
function isSubstring(searchString, subString) {
    return searchString.indexOf(subString) !== -1;
}

console.log("function fizzBuzz(arr)");
console.log(isSubstring("time to program", "time")); // true
console.log(isSubstring("Jump for joy", "joys")); // false
console.log("");

console.log(`
    Phase II - JS Looping Constructs
    -------------------------------------
`);

/*
  #3: fizzBuzz
*/
function fizzBuzz(arr) {
    const newArr = [];
    
    for (let i = 0; i < arr.length; i++) {
        switch (true) {
            case arr[i] % 3 === 0 && arr[i] % 5 === 0:
                continue;
            case arr[i] % 3 === 0:
                newArr.push(arr[i]);
                break;
            case arr[i] % 5 === 0:
                newArr.push(arr[i]);
                break;
        }
    }

    return newArr;
}

console.log("function fizzBuzz(arr)");
console.log(fizzBuzz([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])); // [3, 5, 6, 9, 10]
console.log(fizzBuzz([1, 3, 5, 10, 15, 20, 25, 30])); // [3, 5, 10, 20, 25]
console.log("");

/*
  #4: isPrime
*/
function isPrime(num) {
    if (num <= 1) {
        return false;
    }

    for (let i = 2; i < num; i++) {
        if (num % i === 0) {
            return false;
        }
    }

    return true;
}

console.log("function isPrime(num)");
console.log(isPrime(2)); // true
console.log(isPrime(10)); // false
console.log(isPrime(15485863)); // true
console.log(isPrime(3548563)); // false
console.log("");

/*
 #5: sumOfNPrimes
*/
// function firstNPrimes(num) {
//     for (let i = 1; i < num; i ++) {

//     }
// }

// function sumOfNPrimes(num) {

// }

// console.log(sumOfNPrimes(0)); // 0
// console.log(sumOfNPrimes(1)); // 2
// console.log(sumOfNPrimes(4)); // 17