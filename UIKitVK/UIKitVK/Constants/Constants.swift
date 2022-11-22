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
        static let identifierNewsTableViewCellID = "NewsTableViewCell"
        static let identifierTabBarID = "LoginSegue"
    }
    
    enum FriendsNames {
        static let friendOneName = "Максим"
        static let friendTwoName = "Аня"
        static let friendThreeName = "Рома"
        static let friendFourName = "Арут"
        static let friendFiveName = "Глеб"
        static let friendSixName = "Миша"
        static let friendSevenName = "Алёна"
        static let friendEightName = "Никита"
        static let friendNineName = "Ира"
        static let friendTenName = "Люда"
    }
    
    enum FriendsAvatarImageNames {
        static let friendOneAvatarImageName = "MaxImage"
        static let friendTwoAvatarImageName = "AnnImage"
        static let friendThreeAvatarImageName = "RomaImage"
        static let friendFourAvatarImageName = "ArutImage"
        static let friendFiveAvatarImageName = "GlebImage"
        static let friendSixAvatarImageName = "MishaImage"
        static let friendSevenAvatarImageName = "AlyonaImage"
        static let friendEightAvatarImageName = "NikitaImage"
        static let friendNineAvatarImageName = "IraImage"
        static let friendTenAvatarImageName = "LudaImage"
    }
    
    enum GroupsNames {
        static let groupOneName = "Figma"
        static let groupTwoName = "Game"
        static let groupThreeName = "Cinema"
        static let groupFourName = "Design"
        static let groupFiveName = "Japanism"
        static let groupSixName = "Omanko"
        static let groupSevenName = "Program"
        static let groupEightName = "TJ"
        static let groupNineName = "VC.RU"
        static let groupTenName = "VKGroup"
    }
    
    enum GroupsAvatarImageNames {
        static let groupOneAvatarImageName = "FigmaGroupImage"
        static let groupTwoAvatarImageName = "GameGroupImage"
        static let groupThreeAvatarImageName = "CinemaGroupImage"
        static let groupFourAvatarImageName = "DesignGroupImage"
        static let groupFiveAvatarImageName = "JapanismGroupImage"
        static let groupSixAvatarImageName = "OmankoGroupImage"
        static let groupSevenAvatarImageName = "ProgramGroupImage"
        static let groupEightAvatarImageName = "TJGroupImage"
        static let groupNineAvatarImageName = "VCGroupImage"
        static let groupTenAvatarImageName = "VKGroupImage"
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
    
    enum FriendPhotoImages {
        static let friendPhotos = [
            UIImage(named: "Photo1"),
            UIImage(named: "Photo2"),
            UIImage(named: "Photo3"),
            UIImage(named: "Photo4"),
            UIImage(named: "Photo5")
        ]
    }
    
    enum UrlComponents {
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
        static let queryItemsScopeValue = "262150"
        static let queryItemsResponseTypeKeyName = "response_type"
        static let queryItemsResponseTypeValue = "token"
        static let queryItemsVersionKeyName = "v"
        static let queryItemsVersionValue = "5.68"
        static let urlPath = "/blank.html"
        static let accessTokenKey = "access_token"
        static let userIdKey = "user_id"
        static let baseUrl = "https://api.vk.com/method/"
        static let friendsMethod = "friends.get?"
        static let userId = "/user_ids="
        static let accessToken = "&access_token="
        static let version = "&v=5.131"
        static let friendsFields = "&fields=nickname"
        static let photosMethod = "photos.getAll?"
        static let myGroupMethod = "groups.get?"
        static let myGroupExtended = "extended=1"
        static let otherGroupMethod = "groups.search?"
        static let otherGroupSearch = "&q="
    }
    
    enum InfoNewsPosts {
        static let vkNews = [
            News(
                newsUserInfo: "Максим",
                newsUserData: "08.11.2022г.",
                newsUserAvatarImageName: "MaxImage",
                newsUserText: """
                Октябрь уж наступил — уж роща отряхает
                Последние листы с нагих своих ветвей;
                Дохнул осенний хлад — дорога промерзает.
                Журча еще бежит за мельницу ручей,
                Но пруд уже застыл; сосед мой поспешает
                В отъезжие поля с охотою своей,
                И страждут озими от бешеной забавы,
                И будит лай собак уснувшие дубравы.
                """,
                newsUserPhotoImageName: "Photo1"
            ),
            News(
                newsUserInfo: "Аня",
                newsUserData: "07.11.2022г.",
                newsUserAvatarImageName: "AnnImage",
                newsUserText: """
                Теперь моя пора: я не люблю весны;
                Скучна мне оттепель; вонь, грязь — весной я болен;
                Кровь бродит; чувства, ум тоскою стеснены.
                Суровою зимой я более доволен,
                Люблю ее снега; в присутствии луны
                Как легкий бег саней с подругой быстр и волен,
                Когда под соболем, согрета и свежа,
                Она вам руку жмет, пылая и дрожа!
                """,
                newsUserPhotoImageName: "Photo2"
            )
        ]
    }
}
