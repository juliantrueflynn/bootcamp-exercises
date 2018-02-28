Function.prototype.inherits = function (parent) {
    function Surrogate() {}
    Surrogate.prototype = parent.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
};

// Made with Object.create
Function.prototype.inherits2 = function (parent) {
    this.prototype = Object.create(parent.prototype);
    this.prototype.constructor = this;
};

function Dog (name) {
    this.name = name;
}

Dog.prototype.speak = function () {
    console.log(`Arf! Arf! I'm ${this.name}!`);
};

function Westie (name) {
    Dog.call(this, name);
}

// Westie.inherits(Dog); # Commented out for Object.create phase
Westie.inherits2(Dog);

const sparky = new Westie('Sparky');

sparky.speak();