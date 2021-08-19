import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import QtSensors 5.15
import QtQuick.Controls.Universal 2.15
import QtQuick.Controls.Material 2.15
import QtLevel 1.0

import "Util.js" as Util

Page {
    DropShadow {
        source: tiltTargetArea
        anchors.fill: tiltTargetArea
        verticalOffset: 3
        horizontalOffset: verticalOffset
        color: "#30000000"
        cached: true
    }

    Rectangle {
        id: tiltTargetArea

        property int tiltCenterPointX: width / 2 + (tiltSensor.yRotation * width / 180)
        property int tiltCenterPointY: height / 2 + (tiltSensor.xRotation * width / 180)

        anchors.centerIn: parent
        width: Math.min(parent.width, parent.height) - 20
        height: width
        radius: 3
        color: {
            if (Universal.theme === Universal.Dark)
                return "#444444"
            else
                return "#999999"
        }

        DropShadow {
            source: bubble
            anchors.fill: bubble
            verticalOffset: 3
            horizontalOffset: verticalOffset
            color: "#80000000"
            cached: true
        }

        Rectangle {
            id: bubble

            color: Material.primary
            width: 25
            height: width
            radius: width / 2
            x: tiltTargetArea.tiltCenterPointX - width / 2
            y: tiltTargetArea.tiltCenterPointY - height / 2

            Behavior on x {
                NumberAnimation {
                    duration: 200
                    alwaysRunToEnd: false
                }
            }

            Behavior on y {
                NumberAnimation {
                    duration: 200
                    alwaysRunToEnd: false
                }
            }
        }

        DropShadow {
            source: centerTarget
            anchors.fill: centerTarget
            verticalOffset: 1
            horizontalOffset: verticalOffset
            color: "#80000000"
            cached: true
        }

        Rectangle {
            id: centerTarget

            anchors.centerIn: parent
            color: "transparent"
            border.color: (tiltSensor.xRotation == 0 && tiltSensor.yRotation == 0) ? Material.accent : "black"
            border.width: 3
            width: bubble.width + 2 * border.width + 3
            height: width
            radius: width / 2
        }
    }

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.margins: 20
        text: "x: " + tiltSensor.xRotation + "°\ny: " + tiltSensor.yRotation + "°"
        rotation: orientationSensor.uiRotation

        Behavior on rotation {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }

    TiltSensor {
        id: tiltSensor

        property double xRotation: 0
        property double yRotation: 0

        active: true
        onReadingChanged: {
            var xRot = Util.roundToDecimalPlace(reading.xRotation, settings.decimalPlaces)
            if (xRot < -90)
                xRotation = -180 - xRot
            else if (xRot > 90)
                xRotation = 180 - xRot
            else
                xRotation = xRot

            var yRot = Util.roundToDecimalPlace(reading.yRotation, settings.decimalPlaces)
            if (yRot < -90)
                yRotation = -180 - yRot
            else if (yRot > 90)
                yRotation = 180 - yRot
            else
                yRotation = yRot
        }
    }

    OrientationSensor {
        id: orientationSensor

        property int uiRotation: 0

        active: true
        onReadingChanged: {
            switch (reading.orientation) {
            case OrientationReading.Undefined:
            case OrientationReading.TopUp:
            case OrientationReading.FaceUp:
            case OrientationReading.FaceDown:
                uiRotation = 0
                break
            case OrientationReading.TopDown:
                uiRotation = 180
                break
            case OrientationReading.RightUp:
                uiRotation = 90
                break
            case OrientationReading.LeftUp:
                uiRotation = 270
                break
            }
        }
    }

    Timer {
        running: true
        interval: 50
        onTriggered: if (!tiltSensor.enabled) tiltSensor.active = true
        triggeredOnStart: true
    }

    ToolButton {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
//        anchors.margins: 25
        rotation: orientationSensor.uiRotation // probably not needed, but for completeness' sake
        onClicked: tiltSensor.calibrate()
        icon.width: 40
        icon.height: 40
        icon.source: "qrc:/Calibrate.png"
        height: width

        Behavior on rotation {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }
}
