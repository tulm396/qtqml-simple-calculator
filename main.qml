import QtQuick 2.10
import QtQuick.Controls 2.2
import QtQuick.Window 2.10
import QtQuick.Layouts 1.3

ApplicationWindow {
    id:             mainWindow;
    visible:        true;
    width:          mainWindowWidth;
    height:         mainWindowHeight;
    minimumWidth:   mainWindowWidth;
    minimumHeight:  mainWindowHeight;
    title:          qsTr("Calculator");

    // Declare properties
    property int mainWindowWidth:   332;
    property int mainWindowHeight:  295;

    Rectangle {
        anchors.fill:   parent;
        color:          "lightgrey";

        Column {
            id:         columnBox;
            spacing:    8;
            anchors {
                fill:           parent;
                topMargin:      6;
                bottomMargin:   6;
                leftMargin:     6;
                rightMargin:    6;
            }

            TextField {
                id:                         textFieldInput;
                height:                     mainWindow.height / 6;
                width:                      columnBox.width;
                font.pixelSize:             height / 2;
                horizontalAlignment:        TextInput.AlignRight;
                anchors.horizontalCenter:   parent.horizontalCenter;
            }

            Column {
                id:         columnKeyboard;
                spacing:    6;

                property real buttonHeight: (((columnBox.height - textFieldInput.height) / nButtonRow) - (nButtonRow + spacing / 2));
                property real buttonWidth:  (columnBox.width / nButtonCol) - (nButtonCol - 1);
                property int nButtonCol:    6;
                property int nButtonRow:    4;

                Row {
                    spacing: 6;

                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("7"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("8"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("9"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("/"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; enabled: false; text: qsTr(""); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("C"); }
                }

                Row {
                    spacing: 6;

                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("4"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("5"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("6"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("*"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("("); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr(")"); }
                }

                Row {
                    spacing: 6;

                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("1"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("2"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("3"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("-"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; enabled: false; text: qsTr(""); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("√"); }
                }

                Row {
                    spacing: 6;

                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("0"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("."); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("%"); }
                    Button { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; text: qsTr("+"); }
                    Button { width: columnKeyboard.buttonWidth * 2 + 6; height: columnKeyboard.buttonHeight; text: qsTr("="); }
                }

            }

        }

    }

    Component.onCompleted: {
        console.log("---Into Component.onCompleted---")
    }
}
