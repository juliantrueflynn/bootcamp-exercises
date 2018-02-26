const readline = require('readline');
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const Game = require('./game.js');

const game = new Game();

game.run(reader, () => {
    console.log("You won!");
    reader.close();
});