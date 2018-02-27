// Array#myEach(callback)
Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
        let backupArr = [];
        callback(this[i], i, backupArr[i]);
    }
};

[1, 2, 3].myEach(function (val, i) {
    console.log(`Value = ${val}, Index = ${i}`);
});
console.log("");

// Array#myMap(callback)
Array.prototype.myMap = function (callback) {
    let mapArr = [];

    this.myEach(function (val, i) {
        mapArr.push(callback(val, i));
    });

    return mapArr;
};

[1, 4, 9, 16].myMap(function (x) {
    console.log(x * 2);
});
console.log("");

// Array#myReduce
Array.prototype.myReduce = function (callback, initialValue = 0) {
    let newArr = [];
    let acc = initialValue;

    this.myEach(function (val, i) {
        newArr = callback(acc, val);
        acc = acc + val;
    });

    return newArr;
};

console.log([1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
}));