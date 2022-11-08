// vkNews.swift
// Copyright © RoadMap. All rights reserved.

/// Новости в ВК
var vkNews: [News] = [
    News(
        newsUserInfo: Constants.FriendsNames.friendOneName,
        newsUserData: Constants.NewsData.newsOneDataText,
        newsUserAvatarImageName: Constants.FriendsAvatarImageNames.friendOneAvatarImageName,
        newsUserText: Constants.NewsText.newsOneText,
        newsUserPhotoImageName: Constants.NewsPhotoImageName.newsOnePhotoImageName
    ),
    News(
        newsUserInfo: Constants.FriendsNames.friendTwoName,
        newsUserData: Constants.NewsData.newsTwoDataText,
        newsUserAvatarImageName: Constants.FriendsAvatarImageNames.friendTwoAvatarImageName,
        newsUserText: Constants.NewsText.newsTwoText,
        newsUserPhotoImageName: Constants.NewsPhotoImageName.newsTwoPhotoImageName
    )
]
