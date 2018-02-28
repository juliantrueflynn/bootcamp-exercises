const Util = require("./util");
const MovingObject = require("./util");

const mo = new MovingObject(
    { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
);

const DEFAULTS = {
    COLOR: "#666666",
    RADIUS: "20",
};

const Asteroid = function (options = {}) {
    options.pos = Util.randomVec;
    options.vel = Util.randomVec;
    options.radius = DEFAULTS.RADIUS;
    options.color = DEFAULTS.COLOR;
    
    MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;