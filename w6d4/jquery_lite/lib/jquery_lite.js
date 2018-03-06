/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

window.$l = (selector) => {
    let arr = [];
    if (typeof selector === 'string') {
        arr = document.querySelectorAll(selector);
    } else if (selector instanceof HTMLElement) {
        arr.push(selector);
    }

    return new DOMNodeCollection(arr);
};

/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
    constructor(doms) {
        this.doms = doms;
    }

    each(callback) {
        this.doms.forEach(callback);
    }

    html(str) {
        if (str === undefined) {
            return this.doms[0].innerHTML;
        }
        
        this.each((dom) => {
            dom.innerHTML = str;
        });
    }

    empty() {
        this.each((dom) => {
            dom.innerHTML = "";
        });
    }

    append(node) {
        if (node instanceof HTMLElement) {
            node = node.outerHTML;
        }
        
        this.each((dom) => {
            dom.innerHTML += node;
        });
    }

    attr(k, v) {
        if (v === undefined) {
            return this.doms[0].getAttribute(k);
        }

        this.each((dom) => {
            let elAttr = document.createAttribute(k);
            elAttr.value = v;
            dom.setAttributeNode(elAttr);
        });
    }

    addClass(classNames) {
        let classes = classNames.split(" ");
        this.each(dom => dom.classList.add(...classes));
    }

    removeClass(classNames) {
        let classes = classNames.split(" ");
        this.each(dom => dom.classList.remove(...classes));
    }

    children() {
        let allChildren = [];

        this.each((dom) => {
            let domChildren = Array.from(dom.children);
            allChildren = allChildren.concat(domChildren);
        });
        
        return new DOMNodeCollection(allChildren);
    }

    parent() {
        let parents = [];

        this.each((dom) => {
            parents = parents.push(dom.parentElement);
        });

        return new DOMNodeCollection(parents);
    }

    find(selector) {
        let results = [];

        this.each((dom) => {
            const selected = dom.querySelectorAll(selector);
            if (selected.length > 0) {
                results = results.concat(selected);
            }
        });

        return new DOMNodeCollection(results);
    }

    remove() {
        this.each(node => node.parentNode.removeChild(node));
    }

    on(eventType, listenerCb) {
        this.each((node) => {
            node.addEventListener(eventType, listenerCb);
            node.eventCb = listenerCb;
        });
    }

    off(eventType, listenerCb) {
        this.each((node) => {
            let cb = listenerCb || node.eventCb;
            node.removeEventListener(eventType, cb);
        });
    }
}

module.exports = DOMNodeCollection;

/***/ })
/******/ ]);
//# sourceMappingURL=jquery_lite.js.map