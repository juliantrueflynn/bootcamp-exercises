const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');
const TweetCompose = require('./tweet_compose');

$( () => {
    $('button.follow-toggle').each((i, btn) => new FollowToggle(btn, {}));
    $('.users-search').each((i, search) => new UsersSearch(search));
    $('.tweet-compose').each((i, tweet) => new TweetCompose(tweet));
});