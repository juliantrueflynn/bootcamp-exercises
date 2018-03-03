const APIUtil = require('./api_util');

class TweetCompose {
    constructor(el) {
        this.$el = $(el);
        this.$inputs = this.$el.find(':input');

        this.$el.on('input', 'textarea', this.charCounter);
        this.$el.on('submit', this.submit.bind(this));
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
            $(input).not('[type="submit"]').val('');
            $(input).prop('disabled', false);  
        });

        return formValue;
    }

    handleSuccess(tweet) {
        const feedId = this.$el.data('tweets-ul');
        $(feedId).prepend(`<li>${JSON.stringify(tweet)}</li>`);
    }
}

module.exports = TweetCompose;