const DEFAULTS = {
    DIM_X: "",
    DIM_Y: "",
    NUM_ASTEROIDS: 3
};

function Game() {
    this.dim_x = DEFAULTS.DIM_X;
    this.dim_y = DEFAULTS.DIM_Y;
    this.num_asteroids = DEFAULTS.NUM_ASTEROIDS;
}

Game.prototype.addAsteroids = function () {
    console.log("Hello!");
};

Game.prototype.randomPosition = function () {

};

Game.prototype.draw = function (ctx) {

};

Game.prototype.moveObjects = function () {

};

module.exports = Game;