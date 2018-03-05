const APIUtil = require('./api_util');
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