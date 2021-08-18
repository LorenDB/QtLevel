import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Universal 2.15
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

    Keys.onBackPressed: stack.pop()

    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10

        RowLayout {
            spacing: 10
            Layout.fillWidth: true

            Label {
                text: "App theme"
                Layout.fillWidth: true
            }

            ComboBox {
                model: ["Universal", "Material"]
                currentIndex: model.indexOf(StyleHelper.theme())
                onCurrentTextChanged: StyleHelper.setTheme(currentText)
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
                model: StyleHelper.theme() === "Universal" ? universalColorModel : materialColorModel
                currentIndex: settings.accent
                onActivated: settings.accent = index

                ListModel {
                    id: universalColorModel

                    ListElement { text: "Lime"; value: Universal.Lime }
                    ListElement { text: "Green"; value: Universal.Green }
                    ListElement { text: "Emerald"; value: Universal.Emerald }
                    ListElement { text: "Teal"; value: Universal.Teal }
                    ListElement { text: "Cyan"; value: Universal.Cyan }
                    ListElement { text: "Cobalt"; value: Universal.Cobalt }
                    ListElement { text: "Indigo"; value: Universal.Indigo }
                    ListElement { text: "Violet"; value: Universal.Violet }
                    ListElement { text: "Pink"; value: Universal.Pink }
                    ListElement { text: "Magenta"; value: Universal.Magenta }
                    ListElement { text: "Crimson"; value: Universal.Crimson }
                    ListElement { text: "Red"; value: Universal.Red }
                    ListElement { text: "Orange"; value: Universal.Orange }
                    ListElement { text: "Amber"; value: Universal.Amber }
                    ListElement { text: "Yellow"; value: Universal.Yellow }
                    ListElement { text: "Brown"; value: Universal.Brown }
                    ListElement { text: "Olive"; value: Universal.Olive }
                    ListElement { text: "Steel"; value: Universal.Steel }
                    ListElement { text: "Mauve"; value: Universal.Mauve }
                    ListElement { text: "Taupe"; value: Universal.Taupe }
                }

                ListModel {
                    id: materialColorModel

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
            }
        }

        Item { Layout.fillWidth: true; Layout.fillHeight: true }
    }
}
