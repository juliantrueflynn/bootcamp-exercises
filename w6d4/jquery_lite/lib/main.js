const DOMNodeCollection = require('./dom_node_collection');

window.$l = (selector) => {
    let arr = [];
    if (typeof selector === 'string') {
        arr = document.querySelectorAll(selector);
    } else if (selector instanceof HTMLElement) {
        arr.push(selector);
    }

    if (selector instanceof Function) {
        if (document.readyState === 'complete') {
            console.log("loaded!");
            return selector();
        }
    }

    return new DOMNodeCollection(arr);
};

window.$l.extend = (...objs) => {
    let targetObj = objs.shift();
    targetObj = Object.assign(targetObj, ...objs);
    return targetObj;
};

window.$l.ajax = (options = {}) => {
    let defaults = {
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        error: true,
        success: true,
        data: {},
        method: 'GET',
        url: window.location.href
    };

    options = Object.assign(defaults, options);

    console.log(options);

    const xhr = new XMLHttpRequest();

    xhr.open(options.method, options.url);

    const optionalData = {};
    xhr.send(optionalData);
};