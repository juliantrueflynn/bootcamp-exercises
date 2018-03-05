class DOMNodeCollection {
    constructor(doms) {
        this.doms = doms;
    }

    html(str) {
        if (str === undefined) {
            return this.doms[0].innerHTML;
        }
        
        this.doms.forEach((dom) => {
            dom.innerHTML = str;
        });
    }

    empty() {
        this.doms.forEach((dom) => {
            dom.innerHTML = "";
        });
    }

    append(node) {
        if (node instanceof HTMLElement) {
            node = node.outerHTML;
        }
        
        this.doms.forEach((dom) => {
            dom.innerHTML += node;
        });
    }

    attr(k, v) {
        if (v === undefined) {
            return this.doms[0].getAttribute(k);
        }

        this.doms.forEach((dom) => {
            let elAttr = document.createAttribute(k);
            elAttr.value = v;
            dom.setAttributeNode(elAttr);
        });
    }

    addClass(classNames) {
        let classes = classNames.split(" ");
        this.doms.forEach(dom => dom.classList.add(...classes));
    }

    removeClass(classNames) {
        let classes = classNames.split(" ");
        this.doms.forEach(dom => dom.classList.remove(...classes));
    }

    children() {
        let allChildren = [];

        this.doms.forEach((dom) => {
            let domChildren = Array.from(dom.children);
            allChildren = allChildren.concat(domChildren);
        });
        
        return new DOMNodeCollection(allChildren);
    }

    parent() {
        let parents = [];

        this.doms.forEach((dom) => {
            parents = parents.push(dom.parentElement);
        });

        return new DOMNodeCollection(parents);
    }

    find(selector) {
        let results = [];

        this.doms.forEach((dom) => {
            const selected = dom.querySelectorAll(selector);
            if (selected.length > 0) {
                results = results.concat(selected);
            }
        });

        return new DOMNodeCollection(results);
    }

    remove() {
        let removed = this.doms.forEach((dom, i) => {
            dom.remove();
        });

        return new DOMNodeCollection([]);
    }
}

module.exports = DOMNodeCollection;