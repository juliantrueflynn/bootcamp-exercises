// myBind (without res operator)
Function.prototype.myBind = function(context) {
    const bindArgs = Array.from(arguments).slice(1);
    const self = this;
    
    return function() {
        const callArgs = Array.from(arguments);
        return self.apply(context, bindArgs.concat(callArgs));
    };
};

// myBind (with rest operator)
Function.prototype.myBindRest = function(context, ...bindArgs) {
    return (...callArgs) => {
        return this.apply(context, bindArgs.concat(callArgs));
    };
};

// tests
class Cat {
    constructor(name) {
        this.name = name;
    }
  
    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}
  
const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!

// bind time args are "meow" and "Kush", no call time args
markov.says.myBindRest(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBindRest(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBindRest(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays2 = markov.says.myBindRest(breakfast);
notMarkovSays2("meow", "me");
// Breakfast says meow to me!