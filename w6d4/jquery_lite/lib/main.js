const DOMNodeCollection = require('./dom_node_collection');

window.$l = (selector) => {
    let arr = [];
    if (typeof selector === 'string') {
        arr = document.querySelectorAll(selector);
    } else if (selector instanceof HTMLElement) {
        arr.push(selector);
    }

    return new DOMNodeCollection(arr);
};