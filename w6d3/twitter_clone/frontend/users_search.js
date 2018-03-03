const APIUtil = require('./api_util');
const FollowToggle = require('./follow_toggle');

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