// Array#bubbleSort
// Array.prototype.bubbleSort = function () {
//     let isSorted = false;
//     let i = 0;
    
//     while (isSorted === false) {
//         for (let i2 = i + 1; i2 < this.length; i2++) {
//             if (this[i] > this[i2]) {
//                 let tmp = this[i];
//                 this[1] = this[i2];
//                 this[2] = tmp;
//                 isSorted = false;
//             } else if (this[i] < this[i2]) {
//                 isSorted = true;
//             }
//         }
        
//         if (i + 1 === this.length) {
//             i = 0;
//         } else {
//             i++;
//         }
//     }

//     return this;
// };

// console.log([3, 2, 4, 1].bubbleSort());

// Array#substrings
String.prototype.substrings = function () {
    let substrs = [];

    // for (let i = 0; i < this.length; i++) {
    //     let substrsForChar = [];
    //     substrsForChar.push(this[i]);
        
    //     for (let i2 = i + 1; i2 < this.length; i2++) {
    //         for (let i3 = i2; i3 < this.length; i3++) {
    //             substrsForChar.push(this.slice(i2, i3));
    //         }
    //     }
        
    //     substrs.push(substrsForChar);
    // }

    let str = this;
    for (let i = 0; i < str.length; i++) {
        let substrsForChar = [str[i]];
        for (let i2 = 0; i2 < str.length; i2++) {
            if (i === i2) {
                continue;
            }
            // console.log(`I: ${i}, I2: ${i2}`);
            substrsForChar.push(str.slice(i, i2));
        }
        substrs.push(substrsForChar);
    }

    return substrs;
};

console.log("cat".substrings()); // ["c", "ca", "cat", "a", "at", "t"]
