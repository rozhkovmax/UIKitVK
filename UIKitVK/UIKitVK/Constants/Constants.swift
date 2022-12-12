// Constants.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Константы
enum Constants {
    enum Identifiers {
        static let identifierSingInID = "singInSegue"
        static let identifierFriendTableViewCellID = "FriendTableViewCell"
        static let identifierFriendGalleryCollectionViewCellID = "FriendGalleryCollectionViewCell"
        static let identifierGroupTableViewCellID = "GroupTableViewCell"
        static let identifierSegueOtherGroupsID = "segueOtherGroups"
        static let identifierOtherGroupTableViewCellID = "OtherGroupTableViewCell"
        static let identifierFriendCollectionViewControllerID = "FriendCollectionVC"
        static let identifierNewsHeaderTableViewCellID = "NewsHeaderTableViewCell"
        static let identifierNewsFooterTableViewCellID = "NewsFooterTableViewCell"
        static let identifierNewsPostTableViewCellID = "NewsPostTableViewCell"
        static let identifierNewsPhotoTableViewCellID = "NewsPhotoTableViewCell"
        static let identifierLoginID = "LoginSegue"
        static let identifierFriendsPhotoID = "friendsPhotoSegue"
    }

    enum OtherConstants {
        static let loginText = "q"
        static let passwordText = "q"
        static let alertTitleText = "Внимание!"
        static let alertMessageText = "Введен неверный логин и/или пароль"
        static let alertActionTitleText = "OK"
        static let storyboardName = "Main"
        static let likeZero = "0"
        static let likeOne = "1"
        static let heartImageName = "heart"
        static let heartFillImageName = "heart.fill"
        static let emptyString = ""
        static let scrollViewContentInsetTop = 0.0
        static let scrollViewContentInsetLeft = 0.0
        static let scrollViewContentInsetRight = 0.0
        static let tableViewBackgroundAlpha = 0.95
        static let sectionCheck = 0
        static let collectionViewNumberOfItemsInSection = 1
        static let gestureTranslationComparison = 0.0
        static let gestureNumberPhotoChange = 1
        static let gestureNumberFriendPhotoChange = 1
        static let gestureNumberPhotoCountChange = 0
        static let boldFontSize = 18.0
        static let fontSize = 15.0
        static let likeButtonTagOn = 0
        static let likeButtonTagOff = 1
        static let customViewBorderWidthInitialValue = 0.0
        static let customViewShadowOpacityInitialValue = 0.0
        static let customViewShadowRadiusInitialValue = 0.0
        static let customViewCornerRadius = 40.0
        static let sizeCheck = CGFloat(1.0)
        static let screenEdgeGestureProgressChange = 1.0
        static let popSourceViewControllerPositionY = 0.0
        static let popDestinationViewControllerPositionY = 0.0
        static let pushSourceViewControllerPositionY = 0.0
        static let pushDestinationViewControllerPositionY = 0.0
        static let firstFriendPhotoIndex = 0
        static let ampersand = "&"
        static let equals = "="
        static let paramKeyIndex = 0
        static let paramValueIndex = 1
        static let error = "Ошибка"
        static let cacheLifeTime = 30.0 * 24.0 * 60.0 * 60.0
        static let imagePathName = "Images"
        static let separator: Character = "/"
        static let defaultFileName: Substring = "default"
    }

    enum AnimationOptions {
        static let transformScaleAnimationName = "transform.scale"
        static let springAnimationFromValue = 0.1
        static let springAnimationToValue = 1.0
        static let springAnimationStiffness = 50.0
        static let springAnimationMass = 2.0
        static let springAnimationDuration = 3.0
        static let springAnimationScaleX = 0.1
        static let springAnimationScaleY = 0.1
        static let springAnimationDelay = 0.0
        static let springAnimationDamping = 0.6
        static let springAnimationInitialVelocity = 0.5
        static let circleAnimationDuration = 0.6
        static let circleAnimationAlpha = 0.0
        static let circleAnimationFirstDelay = 0.1
        static let circleAnimationSecondDelay = 0.3
        static let circleAnimationThirdDelay = 0.5
        static let gestureAnimationScaleX = 2.0
        static let gestureAnimationScaleY = 2.0
        static let gestureAnimationDuration = 2.0
        static let gestureAnimationTranslationY = 0.0
        static let likeButtonAnimationDuration = 0.3
        static let likeButtonAnimationDelay = 0.0
        static let likeButtonAnimationTranslationX = 0.0
        static let likeButtonAnimationTranslationY = 50.0
        static let screenEdgeGestureAnimationProgressMaxX = 0.0
        static let screenEdgeGestureAnimationProgressMinX = 1.0
        static let popAnimationDuration = 1.0
        static let popAnimationDestinationRotationAngle = .pi / 2.0
        static let popAnimationSourceRotationAngle = -.pi / 2.0
        static let pushAnimationDuration = 1.0
        static let pushAnimationDestinationRotationAngle = -.pi / 2.0
        static let pushAnimationSourceRotationAngle = .pi / 2.0
    }

    enum CustomColorNames {
        static let blackCustomColorName = "blackCustomColor"
        static let lightGrayCustomColorName = "lightGrayCustomColor"
        static let linkCustomColorName = "linkCustomColor"
        static let redCustomColorName = "redCustomColor"
        static let whiteCustomColorName = "whiteCustomColor"
    }

    enum URLComponents {
        static let scheme = "https"
        static let host = "oauth.vk.com"
        static let path = "/authorize"
        static let queryItemsClientIdKeyName = "client_id"
        static let queryItemsClientIdValue = "51483156"
        static let queryItemsDisplayKeyName = "display"
        static let queryItemsDisplayValue = "mobile"
        static let queryItemsRedirectUriKeyName = "redirect_uri"
        static let queryItemsRedirectUriValue = "https://oauth.vk.com/blank.html"
        static let queryItemsScopeKeyName = "scope"
        static let queryItemsScopeValue = "friends,groups,photos,wall"
        static let queryItemsResponseTypeKeyName = "response_type"
        static let queryItemsResponseTypeValue = "token"
        static let queryItemsVersionKeyName = "v"
        static let queryItemsVersionValue = "5.68"
        static let urlPath = "/blank.html"
        static let accessTokenKey = "access_token"
        static let userIdKey = "user_id"
        static let baseUrl = "https://api.vk.com/method/"
        static let friendsMethod = "friends.get?"
        static let accessToken = "&access_token="
        static let versionKey = "v"
        static let versionValue = "5.131"
        static let friendsFieldsKey = "fields"
        static let friendsFieldsValue = "photo_100"
        static let ownerIdKey = "owner_id"
        static let photosMethod = "photos.getAll?"
        static let myGroupMethod = "groups.get?"
        static let myGroupExtendedKey = "extended"
        static let myGroupExtendedValue = "1"
        static let otherGroupMethod = "groups.search?"
        static let otherGroupSearch = "q"
        static let newsMethod = "newsfeed.get?"
        static let newsFiltersKey = "filters"
        static let newsFiltersPostValue = "post"
        static let newsFiltersPhotoValue = "wall_photo"
    }
}
