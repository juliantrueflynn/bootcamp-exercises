// Array#bubbleSort
Array.prototype.bubbleSort = function () {
    let isSorted = false;
    
    while (!isSorted) {
        isSorted = true;
        for (let i = 0; i < this.length; i++) {
            if (this[i] > this[i + 1]) {
                isSorted = false;
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
            }
        }
    }

    return this;
};

console.log([3, 2, 4, 1].bubbleSort());

// Array#substrings
String.prototype.substrings = function () {
    let substrs = [];

    for (let i = 0; i < this.length; i++) {
        for (let len = 1; (i + len) <= this.length; len++) {
            substrs.push(this.slice(i, i + len));
        }
    }

    return substrs;
};

console.log("cat".substrings()); // ["c", "ca", "cat", "a", "at", "t"]
