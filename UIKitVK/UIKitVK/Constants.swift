// Constants.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

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

    enum NewsPhotoImageName {
        static let newsOnePhotoImageName = "Photo1"
        static let newsTwoPhotoImageName = "Photo2"
    }

    enum NewsData {
        static let newsOneDataText = "08.11.2022г."
        static let newsTwoDataText = "07.11.2022г."
    }

    enum NewsText {
        static let newsOneText = """
        Октябрь уж наступил — уж роща отряхает
        Последние листы с нагих своих ветвей;
        Дохнул осенний хлад — дорога промерзает.
        Журча еще бежит за мельницу ручей,
        Но пруд уже застыл; сосед мой поспешает
        В отъезжие поля с охотою своей,
        И страждут озими от бешеной забавы,
        И будит лай собак уснувшие дубравы.
        """
        static let newsTwoText = """
        Теперь моя пора: я не люблю весны;
        Скучна мне оттепель; вонь, грязь — весной я болен;
        Кровь бродит; чувства, ум тоскою стеснены.
        Суровою зимой я более доволен,
        Люблю ее снега; в присутствии луны
        Как легкий бег саней с подругой быстр и волен,
        Когда под соболем, согрета и свежа,
        Она вам руку жмет, пылая и дрожа!
        """
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
    }

    enum CustomColorName {
        static let blackCustomColorName = "blackCustomColor"
        static let lightGrayCustomColorName = "lightGrayCustomColor"
        static let linkCustomColorName = "linkCustomColor"
        static let redCustomColorName = "redCustomColor"
        static let whiteCustomColorName = "whiteCustomColor"
    }
}
