Function.prototype.curry = function (numArgs) {
    const args = [];
    let fn = this;

    return function _curryFn (arg) {
        args.push(arg);
        console.log(args);
        if (args.length === numArgs) {
            return fn.apply(null, args);
        } else {
            return _curryFn;
        }
    };
};

let testCurry = function () {};

const sum = testCurry.curry(4);
console.log(sum(5)(30)(20)); // => 55