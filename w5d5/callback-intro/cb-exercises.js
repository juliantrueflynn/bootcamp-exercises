/*
  Timing is Everything
*/
class Clock {
    constructor() {
        this.hrs = new Date().getHours();
        this.mins = new Date().getMinutes();
        this.secs = new Date().getSeconds();
        this._tick();
    }

    printTime() {
        let t = new Date();
        console.log(`${t.getHours()}:${t.getMinutes()}:${t.getSeconds()}`);
    }

    _tick() {
        setInterval(() => {
            this.printTime();
        }, 1000);
    }
}

// const clock = new Clock();

/*
  addNumbers
*/
const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        reader.question("Next number?", function(res) {
            let resNum = parseInt(res);
            sum += resNum;
            console.log(`Sum: ${sum}`);
            addNumbers(sum, numsLeft - 1, completionCallback);
        });
    } else if (numsLeft === 0) {
        completionCallback(sum);
        reader.close();
    }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

/*
  absurdBubbleSort
*/
function askIfGreaterThan(el1, el2, callback) {
    reader.question(`Is ${el1} greater than ${el2}? (T or F)`, function(res) {
        let isGreaterThan = (res === 'T');
        let greaterEl = isGreaterThan ? "greater" : "less";
        console.log(`Ok, ${el1} is ${greaterEl} than ${el2}.`);

        callback(isGreaterThan);
    });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i === (arr.length - 1)) {
        outerBubbleSortLoop(madeAnySwaps);
    } else if (i < arr.length - 1) {
        askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
            madeAnySwaps = isGreaterThan;
            
            if (isGreaterThan) {
                [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
            }

            console.log(arr);
            innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
        });
    }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        if (madeAnySwaps) {
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            sortCompletionCallback(arr);
        }
    }

    outerBubbleSortLoop(true);
}

// absurdBubbleSort([3, 2, 1], function (arr) {
//     console.log("Sorted array: " + JSON.stringify(arr));
//     reader.close();
// });

/*
  Function Calling
*/
Object.prototype.myBind = function(context) {
    return () => {
        this.apply(context);
    };
};

// Test for myBind()
class Lamp {
    constructor() {
        this.name = "a lamp";
    }
}
  
const turnOn = function() {
    console.log("Turning on " + this.name);
};
  
const lamp = new Lamp();
  
turnOn(); // should not work the way we want it to
  
const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);
  
boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"