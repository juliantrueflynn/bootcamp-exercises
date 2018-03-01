const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function teaAndBiscuits (callback) {
    let first, second;

    reader.question('Would you like some tea?', (res) => {
        console.log(`You replied ${res}.`);
        reader.question('Would you like some biscuits?', (res2) => {
            first = res;
            second = res2;
            console.log(`You replied ${res2}.`);

            const firstRes = (first === 'yes') ? 'do' : 'don\'t';
            const secondRes = (second === 'yes') ? 'do' : 'don\'t';

            callback(firstRes, secondRes);
        });
    });
}

teaAndBiscuits(function (first, second) {
    console.log(`You ${first} want tea and you ${second} want biscuits.`);
    reader.close();
});