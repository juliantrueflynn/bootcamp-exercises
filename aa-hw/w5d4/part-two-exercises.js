console.log(`
    Phase I: Callbacks
`);

/*
  #6: titleize
*/
function titleize(arr, callback) {
    let titles = arr.map(title => `Mx. ${title} Jingleheimer Schmidt`);
    callback(titles);
}

console.log("titleize(names, printCallback)");
titleize(["Mary", "Brian", "Leo"], (titles) => {
    titles.forEach(title => console.log(title));
});
console.log("");

console.log(`
    Phase II: Constructors, Prototypes, and "this"
`);

/*
  #7: Elephant prototype functions
*/
let Elephant = function(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}; 

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'pphhrrRRRR!'`);
};

Elephant.prototype.grow = function() {
    return this.height + 12;
};

Elephant.prototype.play = function() {
    let tricksSize = this.tricks.length;
    let randomIndex = Math.floor(Math.random() * Math.floor(tricksSize));
    console.log(this.tricks[randomIndex]);
};

let dumbo = new Elephant("Dumbo", 100, ['sitting', 'standing', 'dancing']);
dumbo.trumpet();
console.log(dumbo);
dumbo.grow();
console.log(dumbo);
dumbo.play();
dumbo.play();
dumbo.play();

console.log(`
    Phase III: Function Invocation
`);

/*
  #8: paradeHelper
*/
// Generate more elephants for example, including Dumbo
let ellie = new Elephant("Ellie", 90, ['sitting', 'speaking', 'dancing']);
let charlie = new Elephant("Charlie", 200, ['jumping', 'spinning', 'giving rides']);
let frankie = new Elephant("Frankie", 80, ['running', 'dancing']);

let herd = [dumbo, ellie, charlie, frankie];

Elephant.paradeHelper = (elephant) => {
    console.log(`${elephant.name} is trotting by!`);
};

herd.forEach(Elephant.paradeHelper);

console.log(`
    Phase IV: Closures
`);

/*
 #9: dinerBreakfast
*/
function dinerBreakfast() {
    let orders = "";
    return (order = 'scrambled eggs') => {
        if (orders === "") {
            orders = order;
        } else {
            orders += ` and ${order}`;
        }
        console.log(`I'd like ${orders} please.`);
    };
}

let bfastOrder = dinerBreakfast();
bfastOrder();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");