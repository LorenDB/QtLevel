import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Qt.labs.settings 1.1
import QtSensors 5.15
import QtGraphicalEffects 1.0
import QtLevel 1.0

import "Util.js" as Util

Window {
    id: rootWindow

    title: "QtLevel"
    width: 640
    height: 480
    visible: true

    // this back key handling method comes from https://stackoverflow.com/a/67357598/12533859
    Component.onCompleted: {
        contentItem.Keys.released.connect(function(event) {
            if (event.key === Qt.Key_Back && stack.depth > 1) {
                event.accepted = true
                stack.pop()
            }
        })
    }

    Material.theme: settings.theme
    Material.primary: settings.primary
    Material.accent: settings.accent

    Settings {
        id: settings

        property int theme: Material.Dark
        property int primary: Material.Indigo
        property int accent: Material.Pink
        property int decimalPlaces: 0
    }

    SettingsPage {
        id: settingsPage
    }

    Drawer {
        id: drawer

        edge: Drawer.Left
        width: parent.width * 2 / 3
        height: parent.height
        dragMargin: 10

        ItemDelegate {
            text: qsTr("Settings")
            width: parent.width
            onClicked: {
                if (stack.currentItem != settingsPage)
                    stack.push(settingsPage)
                drawer.close()
            }
        }
    }

    StackView {
        id: stack

        Keys.onBackPressed: stack.pop()

        anchors.fill: parent
        initialItem: LevelPage {}
    }
}
