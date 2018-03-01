class Game {
    constructor() {
        this.stacks = [[3, 2, 1], [], []];
    }

    isValidMove(startTowerIdx, endTowerIdx) {
        let startLen = this.stacks[startTowerIdx].length;
        let endLen = this.stacks[endTowerIdx].length;
        let startTowerLastDisc = this.stacks[startTowerIdx][startLen - 1];
        let endTowerFirstDisc = this.stacks[endTowerIdx][0];

        if (startLen === 0) {
            return false;
        } else if (endLen === 0) {
            return true;
        } else {
            return startTowerLastDisc < endTowerFirstDisc;
        }
    }

    move(startTowerIdx, endTowerIdx) {
        if (this.isValidMove(startTowerIdx, endTowerIdx)) {
            let startTowerLastDisc = this.stacks[startTowerIdx].pop();
            let endTower = this.stacks[endTowerIdx];
            endTower.push(startTowerLastDisc);
            return true;
        } else {
            return false;
        }
    }

    promptMove(reader, callback) {
        reader.question("Which stack?", function (resStartTower) {
            reader.question("Move to which stack?", function (resEndTower) {
                let startTowerIdx = parseInt(resStartTower);
                let endTowerIdx = parseInt(resEndTower);

                callback(startTowerIdx, endTowerIdx);
            });
        });
    }

    print() {
        console.log(JSON.stringify(this.stacks));
    }

    isWon(wonCallback) {
        let won = this.stacks[1].length === 3 || this.stacks[2].length === 3;
        wonCallback(won);
    }

    run(reader, completionCallback) {
        this.print();
        this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
            if (this.isValidMove(startTowerIdx, endTowerIdx)) {
                this.move(startTowerIdx, endTowerIdx);
            } else {
                console.log("move failed");
            }

            this.isWon((isWinner) => {
                if (isWinner) {
                    this.print();
                    completionCallback();
                } else {
                    this.run(reader, completionCallback);
                }
            });
        });
    }
}

module.exports = Game;