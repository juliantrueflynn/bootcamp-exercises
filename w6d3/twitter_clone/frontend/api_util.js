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