const View = require('./ttt-view');
const Game = require('./game.js');

const g = new Game();

$( () => {
  const view = new View(g, $('figure.ttt'));
});
