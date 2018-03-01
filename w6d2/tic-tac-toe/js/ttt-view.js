class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {
    const $ul = $('ul.grid');

    $ul.on('click', '.item:not(.clicked)', (e) => {
      const $selected = $(e.currentTarget);
      $selected.addClass('clicked');
      this.makeMove($selected);
    });

    $ul.on('mouseenter', '.item:not(.clicked)', function (e) {
      $(e.currentTarget).addClass('hover');
    });

    $ul.on('mouseout', '.hover', function (e) {
      $(e.currentTarget).removeClass('hover');
    });
  }

  makeMove($square) {
    // console.log(this.game.playMove([1, 2]));
    const pos = $square.data('pos');
    const player = this.game.currentPlayer;
    console.log(player);
    this.game.playMove([pos['row'], pos['col']]);
    $square.addClass(`player-${player}`);
    $square.html(`<span>${player}</span>`);

    if (this.game.isOver()) {
      if (this.game.winner()) {
        console.log(`${this.game.winner()} has won!`);
      } else {
        console.log('NO ONE WINS!');
      }
      console.log("Done");
    }
  }

  setupBoard() {
    $(this.$el).html('<ul class="grid"></ul>');

    let col = 0;

    for (let i = 0; i < 9; i++) {
      const row = Math.floor(i / 3);
      const pos = `{ "row": ${row}, "col": ${col} }`;
      col++;
      
      if (col % 3 === 0) {
        col = 0;
      }

      $('ul.grid').append(`<li data-pos='${pos}' class="item"></li>`);
    }

    this.bindEvents();
  }
}

module.exports = View;
