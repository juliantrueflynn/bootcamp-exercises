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
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(1);

class FollowToggle {
    constructor(el, options = {}) {
        this.$el = $(el);
        this.userId = this.$el.data('user-id') || options.userId;
        this.followState = this.$el.data('initial-follow-state') || options.followState;

        this.render();
        this.$el.on('click', this.handleClick.bind(this));
    }

    render() {
        switch (this.followState) {
            case 'followed':
                this.$el.prop('disabled', false);
                this.$el.html('Unfollow!');
                break;
            case 'unfollowed':
                this.$el.prop('disabled', false);
                this.$el.html('Follow!');
                break;
            case 'following':
                this.$el.prop('disabled', true);
                this.$el.html('Following...');
                break;
            case 'unfollowing':
                this.$el.prop('disabled', true);
                this.$el.html('Unfollowing...');
                break;
        }
      
    }

    handleClick(e) {
        const followToggle = this;
        
        e.preventDefault();

        if (this.followState === 'followed') {
            this.followState = 'following';
            this.render();
            APIUtil.unfollowUser(this.userId).then(() => {
                followToggle.followState = 'unfollowed';
                followToggle.render();
            });
        } else if (this.followState === 'unfollowed') {
            this.followState = 'following';
            this.render();
            APIUtil.followUser(this.userId).then(() => {
                followToggle.followState = 'followed';
                followToggle.render();
            });
        }
    }
}

module.exports = FollowToggle;

/***/ }),
/* 1 */
/***/ (function(module, exports) {

const APIUtil = {
    followUser: id => APIUtil.changeFollowStatus(id, 'POST'),
    unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),

    changeFollowStatus: (id, method) => (
        $.ajax({
            url: `/users/${id}/follow`,
            dataType: 'json',
            method
        })
    ),

    searchUsers: query => (
        $.ajax({
            url: `/users/search`,
            method: 'GET',
            dataType: 'json',
            data: { query }
        })
    ),

    createTweet: tweet => (
        $.ajax({
            url: '/tweets',
            method: 'POST',
            dataType: 'json',
            data: tweet.serialize()
        })
    )
};

module.exports = APIUtil;

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(0);
const UsersSearch = __webpack_require__(3);
const TweetCompose = __webpack_require__(4);

$( () => {
    $('button.follow-toggle').each((i, btn) => new FollowToggle(btn, {}));
    $('.users-search').each((i, search) => new UsersSearch(search));
    $('.tweet-compose').each((i, tweet) => new TweetCompose(tweet));
});

/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(1);
const FollowToggle = __webpack_require__(0);

class UsersSearch {
    constructor(el) {
        this.$el = $(el);
        this.$input = this.$el.find($('.user-search-input'));
        this.$ul = this.$el.find('.users');

        this.$input.on('input', this.handleInput.bind(this));
    }

    handleInput(event) {
        if (this.$input.val() === '') {
            this.renderResults([]);
            return;
        }

        APIUtil.searchUsers(this.$input.val())
            .then(users => this.renderResults(users));
    }

    renderResults(users) {
        this.$ul.empty();

        $.each(users, (i, user) => {
            const $followBtn = $('<button></button>');

            new FollowToggle($followBtn, {
                userId: user.id,
                followState: user.followed ? 'followed' : 'unfollowed'
            });

            let $a = $('<a></a>');
            $a.text(`${user.username}`);
            $a.attr('href', `/users/${user.id}`);

            const $li = $('<li></li>');
            $li.append($followBtn);
            $li.append($a);

            this.$ul.append($li);
        });
    }
}

module.exports = UsersSearch;

/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(1);
var indextest = 0;

class TweetCompose {
    constructor(el) {
        this.$el = $(el);
        this.$inputs = this.$el.find(':input');

        this.$el.on('input', 'textarea', this.charCounter);
        this.$el.on('submit', this.submit.bind(this));
        this.$el.on('click', '.add-mention', this.newUserSelect);
        this.$el.on('click', '.remove-mentioned-user', this.removeMentionedUser);
    }

    charCounter(event) {
        const $content = $(event.currentTarget);
        const numCharsLeft = 140 - $content.val().length;
        $('.chars-left').text(`${numCharsLeft} characters left`);
    }

    submit(event) {
        event.preventDefault();
        APIUtil.createTweet(this.$el)
            .then(this.clearInput.bind(this))
            .then(this.handleSuccess.bind(this));
        this.$inputs.each((i, input) => {
            $(input).prop('disabled', true);  
        });
    }

    clearInput(formValue) {
        this.$inputs.each((i, input) => {
            $(input).not('[type="submit"], .add-mention').val('');
            $(input).prop('disabled', false);  
        });

        this.$el.find('.mentioned-users').empty();

        return formValue;
    }

    handleSuccess(tweet) {
        const feedId = this.$el.data('tweets-ul');
        $(feedId).prepend(`<li>${JSON.stringify(tweet)}</li>`);
    }
    
    newUserSelect(event) {
        const $userUl = $('.mentioned-users');
        const del = '<a class="remove-mentioned-user" href="#">X</a>';
        let selectOpts = "";
        $.each(window.users, (i, u) => {
            selectOpts += `<option value="${u.id}">${u.username}</option>`;
        });
    
        $userUl.append(`<li><select name="tweet[mentioned_user_ids][]">${selectOpts}</select> ${del}</li>`);
    }

    removeMentionedUser(event) {
        event.preventDefault();

        $(event.currentTarget).parent().remove();
    }
}

module.exports = TweetCompose;

/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map