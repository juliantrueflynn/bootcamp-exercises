// sum (without rest operator)
function sum() {
    let args = Array.from(arguments);
    return args.reduce(function(prev, current) {
        return prev + current;
    });
}

// sum (with rest operator)
function sumRest(...nums) {
    return nums.reduce(function(prev, current) {
        return prev + current;
    });
}

console.log(sum(1, 2, 3)); // 6
console.log(sumRest(1, 2, 3)); // 6