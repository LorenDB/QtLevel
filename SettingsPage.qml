import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtLevel 1.0

Page {
    id: settingsPageRoot

    header: ToolBar {
        Label {
            anchors.centerIn: parent
            text: qsTr("Settings")
        }
    }

    ListModel {
        id: colorModel

        ListElement { text: "Red"; value: Material.Red }
        ListElement { text: "Pink"; value: Material.Pink }
        ListElement { text: "Purple"; value: Material.Purple }
        ListElement { text: "DeepPurple"; value: Material.DeepPurple }
        ListElement { text: "Indigo"; value: Material.Indigo }
        ListElement { text: "Blue"; value: Material.Blue }
        ListElement { text: "LightBlue"; value: Material.LightBlue }
        ListElement { text: "Cyan"; value: Material.Cyan }
        ListElement { text: "Teal"; value: Material.Teal }
        ListElement { text: "Green"; value: Material.Green }
        ListElement { text: "LightGreen"; value: Material.LightGreen }
        ListElement { text: "Lime"; value: Material.Lime }
        ListElement { text: "Yellow"; value: Material.Yellow }
        ListElement { text: "Amber"; value: Material.Amber }
        ListElement { text: "Orange"; value: Material.Orange }
        ListElement { text: "DeepOrange"; value: Material.DeepOrange }
        ListElement { text: "Brown"; value: Material.Brown }
        ListElement { text: "Grey"; value: Material.Grey }
        ListElement { text: "BlueGrey"; value: Material.BlueGrey }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10

        Label {
            font.pointSize: 22
            text: "Level options"
            Layout.fillWidth: true
        }

        RowLayout {
            spacing: 10
            Layout.fillWidth: true

            Label {
                text: "Decimal places for degrees"
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }

            SpinBox {
                from: 0
                to: 10
                value: settings.decimalPlaces
                onValueChanged: settings.decimalPlaces = value
            }
        }

        Label {
            font.pointSize: 22
            text: "App theming options"
            Layout.fillWidth: true
        }

        RowLayout {
            spacing: 10
            Layout.fillWidth: true

            Label {
                text: "App theme"
                Layout.fillWidth: true
            }

            ComboBox {
                textRole: "text"
                model: ListModel {
                    ListElement { text: "Light"; value: Material.Light }
                    ListElement { text: "Dark"; value: Material.Dark }
                    ListElement { text: "System"; value: Material.System }
                }
            }
        }

        RowLayout {
            spacing: 10
            Layout.fillWidth: true

            Label {
                text: "App primary color"
                Layout.fillWidth: true
            }

            ComboBox {
                textRole: "text"
                currentIndex: settings.primary
                onActivated: settings.primary = index
                model: colorModel
            }
        }

        RowLayout {
            spacing: 10
            Layout.fillWidth: true

            Label {
                text: "App accent color"
                Layout.fillWidth: true
            }

            ComboBox {
                textRole: "text"
                currentIndex: settings.accent
                onActivated: settings.accent = index
                model: colorModel
            }
        }

        Item { Layout.fillWidth: true; Layout.fillHeight: true }
    }
}
