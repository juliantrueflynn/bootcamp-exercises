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
}

module.exports = DOMNodeCollection;