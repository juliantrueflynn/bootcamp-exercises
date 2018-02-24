// uniq
Array.prototype.uniq = function () {
    const uniques = [];

    this.forEach(function (el) {
        if (! uniques.includes(el)) {
            uniques.push(el);
        }
    });

    return uniques;
};

// twoSum
Array.prototype.twoSum = function () {
    const pairs = [];

    for (let i = 0; i < this.length; i++) {
        for (let i2 = i + 1; i2 < this.length; i2++) {
            if (i === i2) {
                continue;
            }
            if (this[i] + this[i2] === 0) {
                pairs.push([i, i2]);
            }
        }
    }
    
    return pairs;
};

// transpose
Array.prototype.transpose = function () {
    let matrix = [];

    // let i = 0;
    // this.forEach(function(row) {
    //     let i2 = 0;
    //     row.forEach(function(col) {
    //         matrix.push(arr[i2][i]);
    //         i2++;
    //     });
    //     i++;
    // });

    for (let i = 0; i < this.length; i++) {
        for (let i2 = 0; i2 < this.length; i2++) {
            if (this[i2][i] !== undefined) {
                matrix.push(this[i2][i]);
            }
        }
    }

    return matrix;
};

console.log([[1, 2], [3, 4], [5, 6]].transpose());