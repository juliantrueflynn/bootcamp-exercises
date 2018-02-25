// range(start, end)
function range(start, end) {
    if (start === end) {
        return [];
    }

    let r = range(start, end - 1);
    r.push(end - 1);
    return r;
}
console.log(range(1, 5));

// sumRec(arr)
function sumRec(arr) {
    if (arr.length === 1) {
        return arr[0];
    }

    let lastVal = arr.pop();
    arr[arr.length - 1] += lastVal;
    return sumRec(arr);
}
console.log(sumRec([1, 2, 3]));

// exponent(base, exp)
function exponent(base, exp) {
    if (exp === 0) {
        return 1;
    }

    let newExp;

    if (exp % 2 === 0) {
        newExp = Math.pow(exponent(base, exp / 2), 2);
    } else {
        newExp = base * (Math.pow(exponent(base, (exp - 1) / 2), 2));
    }

    return newExp;
}
console.log(exponent(4, 3));

// fibonacci(n)
function fibonacci(n) {
    if (n === 2) {
        return [0, 1];
    } else {
        let fibs = fibonacci(n - 1);
        fibs.push(fibs[fibs.length - 2] + fibs[fibs.length - 1]);
        return fibs;
    }
}

console.log(fibonacci(13));

function hammerTime(time) {
    alert(`${time} is hammertime!`);
}