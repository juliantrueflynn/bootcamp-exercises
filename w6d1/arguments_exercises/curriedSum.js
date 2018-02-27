function curriedSum(numArgs) {
    const numbers = [];
    let sum = 0;

    return function _curriedSum (num) {
        numbers.push(num);
        sum += num;

        if (numbers.length === numArgs) {
            return sum;
        } else {
            return _curriedSum;
        }
    };
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56